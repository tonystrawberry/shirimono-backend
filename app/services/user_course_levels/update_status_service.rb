module UserCourseLevels
  class UpdateStatusService
    attr_reader :user, :course_slug, :point_type

    def initialize(user:, course_slug:, point_type:)
      @user = user
      @course_slug = course_slug
      @point_type = point_type
    end

    def call
      ActiveRecord::Base.transaction do
        user_course_levels.find_each do |user_course_level|
          update_status(user_course_level)
        end
      end
    end

    private

    def user_course_levels
      @user_course_levels ||= user.user_course_levels
                                 .joins(course_level: :course)
                                 .where(courses: { slug: course_slug })
                                 .where(course_levels: { point_type: point_type })
    end

    def update_status(user_course_level)
      exercises = exercises_for_course_level(user_course_level)

      # Set status to ready if there are no exercises
      if exercises.empty?
        user_course_level.update!(status: :ready)
        return
      end

      reviews = user_reviews_for_exercises(exercises)

      new_status = calculate_status(exercises, reviews)
      user_course_level.update!(status: new_status) if user_course_level.status != new_status
    end

    def exercises_for_course_level(user_course_level)
      case point_type
      when 'kanji'
        user_course_level.kanji_exercises
      when 'vocabulary'
        user_course_level.vocabulary_exercises
      when 'grammar'
        user_course_level.grammar_exercises
      end
    end

    def user_reviews_for_exercises(exercises)
      UserReview.where(
        user_course: user.user_courses.joins(:course).where(courses: { slug: course_slug }),
        point_exercise_type: exercises.first.class.name,
        point_exercise_id: exercises.pluck(:id)
      )
    end

    def calculate_status(exercises, reviews)
      return :ready if reviews.empty?

      exercise_ids = exercises.pluck(:id).to_set
      reviewed_exercise_ids = reviews.select(:point_exercise_id).distinct.pluck(:point_exercise_id).to_set
      max_memorization_status = UserReview.memorization_statuses.values.max

      if reviewed_exercise_ids != exercise_ids
        :lessons_not_completed
      else
        # Get IDs of exercises with max memorization status
        mastered_exercise_ids = reviews.where(memorization_status: max_memorization_status)
                                     .select(:point_exercise_id)
                                     .distinct
                                     .pluck(:point_exercise_id)
                                     .to_set

        if mastered_exercise_ids == exercise_ids
          :done
        else
          :in_progress
        end
      end
    end
  end
end