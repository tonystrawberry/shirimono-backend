# frozen_string_literal: true

##
# This service updates the status of a user's course levels based on the exercises and reviews.
# It is used to update the status of a user's course levels after a user has completed an exercise.
#
# @param user [User] The user to update the status for
# @param course_slug [String] The slug of the course to update the status for
# @param point_type [String] The type of point to update the status for
#
module UserCourseLevels
  class UpdateStatusService
    attr_reader :user, :course_slug, :point_type

    def initialize(user:, course_slug:, point_type:)
      @user = user
      @course_slug = course_slug
      @point_type = point_type
    end

    def call
      return if course.blank?

      ActiveRecord::Base.transaction do
        case point_type
        when 'kanji'
          course.course_level_kanjis.find_each do |course_level_kanji|
            user_course_level = UserCourseLevelKanji.find_or_create_by!(user_course:, course_level_kanji:)
            update_status(user_course_level:)
          end
        when 'vocabulary'
          course.course_level_vocabularies.find_each do |course_level_vocabulary|
            user_course_level = UserCourseLevelVocabulary.find_or_create_by!(user_course:, course_level_vocabulary:)
            update_status(user_course_level:)
          end
        when 'grammar'
          course.course_level_grammars.find_each do |course_level_grammar|
            user_course_level = UserCourseLevelGrammar.find_or_create_by!(user_course:, course_level_grammar:)
            update_status(user_course_level:)
          end
        end
      end
    end

    private

    def course
      @course ||= Course.find_by(slug: course_slug)
    end

    def user_course
      @user_course ||= UserCourse.find_or_create_by!(user:, course:)
    end

    # Update the status of a user course level
    # @param user_course_level [UserCourseLevel] The user course level to update the status for
    # @return [void]
    def update_status(user_course_level:)
      exercises = exercises_for_course_level(user_course_level:)

      if exercises.empty?
        user_course_level.update!(status: :ready)
        return
      end

      user_reviews = user_reviews_for_exercises(exercises:, user_course_level:)

      new_status = calculate_status(exercises:, user_reviews:)
      user_course_level.update!(status: new_status) if user_course_level.status != new_status
    end

    # Get all exercises for a user course level
    # @param user_course_level [UserCourseLevel] The user course level to get the exercises for
    # @return [ActiveRecord::Relation<KanjiExercise, VocabularyExercise, GrammarExercise>]
    def exercises_for_course_level(user_course_level:)
      case point_type
      when 'kanji'
        user_course_level.course_level_kanji.kanji_exercises
      when 'vocabulary'
        user_course_level.course_level_vocabulary.vocabulary_exercises
      when 'grammar'
        user_course_level.course_level_grammar.grammar_exercises
      end
    end

    # Get all user reviews for a user course level
    # @param exercises [ActiveRecord::Relation<KanjiExercise, VocabularyExercise, GrammarExercise>] The exercises to get the user reviews for
    # @return [ActiveRecord::Relation<UserReviewKanji, UserReviewVocabulary, UserReviewGrammar>]
    def user_reviews_for_exercises(exercises:, user_course_level:)
      return UserReview.none if exercises.empty?

      case point_type
      when 'kanji'
        UserReviewKanji.where(
          user_course_level_kanji_link: user_course_level.user_course_level_kanji_links,
          kanji_exercise_id: exercises.pluck(:id)
        )
      when 'vocabulary'
        UserReviewVocabulary.where(
          user_course_level_vocabulary_link: user_course_level.user_course_level_vocabulary_links,
          vocabulary_exercise_id: exercises.pluck(:id)
        )
      when 'grammar'
        UserReviewGrammar.where(
          user_course_level_grammar_link: user_course_level.user_course_level_grammar_links,
          grammar_exercise_id: exercises.pluck(:id)
        )
      end
    end

    # Calculate the status of a user course level
    # @param exercises [ActiveRecord::Relation<KanjiExercise, VocabularyExercise, GrammarExercise>] The exercises to calculate the status for
    # @param user_reviews [ActiveRecord::Relation<UserReviewKanji, UserReviewVocabulary, UserReviewGrammar>] The user reviews to calculate the status for
    # @return [Symbol] The status of the user course level
    def calculate_status(exercises:, user_reviews:)
      return :ready if user_reviews.empty?

      exercise_ids = exercises.pluck(:id).to_set
      reviewed_exercise_ids = case point_type
      when 'kanji'
        user_reviews.pluck(:kanji_exercise_id).uniq.to_set
      when 'vocabulary'
        user_reviews.pluck(:vocabulary_exercise_id).uniq.to_set
      when 'grammar'
        user_reviews.pluck(:grammar_exercise_id).uniq.to_set
      end

      max_memorization_status = case point_type
        when 'kanji'
          UserReviewKanji.memorization_statuses.values.max
        when 'vocabulary'
          UserReviewVocabulary.memorization_statuses.values.max
        when 'grammar'
          UserReviewGrammar.memorization_statuses.values.max
        end

      if reviewed_exercise_ids != exercise_ids
        :partially_in_progress
      else
        # Get IDs of exercises with max memorization status
        mastered_exercise_ids = case point_type
          when 'kanji'
            user_reviews.where(memorization_status: max_memorization_status).pluck(:kanji_exercise_id).uniq.to_set
          when 'vocabulary'
            user_reviews.where(memorization_status: max_memorization_status).pluck(:vocabulary_exercise_id).uniq.to_set
          when 'grammar'
            user_reviews.where(memorization_status: max_memorization_status).pluck(:grammar_exercise_id).uniq.to_set
          end

        if mastered_exercise_ids == exercise_ids
          :completed
        else
          :all_in_progress
        end
      end
    end
  end
end