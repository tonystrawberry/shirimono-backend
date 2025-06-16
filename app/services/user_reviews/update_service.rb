module UserReviews
  class UpdateService
    attr_reader :user, :course_slug, :level, :point_exercise_type, :point_exercise_id

    def initialize(user:, course_slug:, level:, point_exercise_type:, point_exercise_id:)
      @user = user
      @course_slug = course_slug
      @level = level
      @point_exercise_type = point_exercise_type
      @point_exercise_id = point_exercise_id
    end

    def correct_review
      ActiveRecord::Base.transaction do
        user_review = find_or_create_user_review

        if user_review.new_record?
          user_review.assign_attributes(
            memorization_status: :level_0,
            number_of_total_reviews: 0,
            number_of_correct_reviews: 0,
            next_review_at: calculate_next_review_date(0)
          )
          user_review.save!
        else

          user_review.increment!(:number_of_total_reviews)
          user_review.increment!(:number_of_correct_reviews)

          new_status = user_review.memorization_status_before_type_cast + 1
          new_status = UserReview.memorization_statuses.values.max if new_status > UserReview.memorization_statuses.values.max

          user_review.update!(
            memorization_status: new_status,
            next_review_at: calculate_next_review_date(new_status)
          )
        end

        user_review
      end
    end

    def incorrect_review(user_review)
      ActiveRecord::Base.transaction do
        user_review.increment!(:number_of_total_reviews)

        # Decrease the memorization status by 1, but don't go below 0
        new_status = [user_review.memorization_status_before_type_cast - 1, 0].max

        user_review.update!(
          memorization_status: new_status,
          next_review_at: calculate_next_review_date(0) # Keep quick review time
        )

        user_review
      end
    end

    private

    def find_or_create_user_review
      user_course = user.user_courses.joins(:course)
                       .find_by!(courses: { slug: course_slug })

      course = Course.find_by(slug: course_slug)
      course_level = course.course_levels.find_by!(point_type: point_exercise_type, position: level)

      user_course_level = user_course.user_course_levels.find_by!(course_level: course_level)

      point = case point_exercise_type
              when 'kanji' then course_level.kanji_exercises.find_by!(id: point_exercise_id).kanji
              when 'vocabulary' then course_level.vocabulary_exercises.find_by!(id: point_exercise_id).vocabulary
              when 'grammar' then course_level.grammar_exercises.find_by!(id: point_exercise_id).grammar
              end

      course_level_point = case point_exercise_type
                           when 'kanji' then user_course_level.course_level.course_level_kanjis.find_by!(kanji: point)
                           when 'vocabulary' then user_course_level.course_level.course_level_vocabularies.find_by!(vocabulary: point)
                           when 'grammar' then user_course_level.course_level.course_level_grammars.find_by!(grammar: point)
                           end

      user_review = user_course_level.user_reviews
                              .find_or_initialize_by(
                                course_point: course_level_point,
                                point_exercise_type: get_point_exercise_type,
                                point_exercise_id: point_exercise_id
                              )

      user_review
    end

    def calculate_next_review_date(level)
      case level
      when 0 then 4.hours.from_now   # Level 0: Review in 4 hours
      when 1 then 8.hours.from_now   # Level 1: Review in 8 hours
      when 2 then 1.day.from_now     # Level 2: Review in 1 day
      when 3 then 2.days.from_now    # Level 3: Review in 2 days
      when 4 then 1.week.from_now    # Level 4: Review in 1 week
      when 5 then 2.weeks.from_now   # Level 5: Review in 2 weeks
      else 1.month.from_now          # Level 6: Review in 1 month
      end
    end

    def get_course_point
      case course_point_type
      when 'kanji' then
        CourseLevelKanji.joins(:kanji).find_by!(kanji: { id: course_point_id })
      when 'vocabulary' then
        CourseLevelVocabulary.joins(:vocabulary).find_by!(vocabulary: { id: course_point_id })
      when 'grammar' then
        CourseLevelGrammar.joins(:grammar).find_by!(grammar: { id: course_point_id })
      else raise "Invalid course point type: #{course_point_type}"
      end

    end

    def get_point_exercise_type
      case point_exercise_type
      when 'kanji' then 'KanjiExercise'
      when 'vocabulary' then 'VocabularyExercise'
      when 'grammar' then 'GrammarExercise'
      else raise "Invalid point exercise type: #{point_exercise_type}"
      end
    end
  end
end