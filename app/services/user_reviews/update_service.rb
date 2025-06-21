module UserReviews
  class UpdateService
    attr_reader :user, :course_slug, :position, :point_exercise_type, :point_exercise_id, :point

    def initialize(user:, course_slug:, position:, point_exercise_type:, point_exercise_id:)
      @user = user
      @course_slug = course_slug
      @position = position
      @point_exercise_type = point_exercise_type
      @point_exercise_id = point_exercise_id

      case point_exercise_type
      when 'kanji'
        kanji_exercise = KanjiExercise.find(point_exercise_id)
        kanji = kanji_exercise.kanji
      when 'vocabulary'
        vocabulary_exercise = VocabularyExercise.find(point_exercise_id)
        vocabulary = vocabulary_exercise.vocabulary
      when 'grammar'
        grammar_exercise = GrammarExercise.find(point_exercise_id)
        grammar = grammar_exercise.grammar
      end

      @point = case point_exercise_type
               when 'kanji' then kanji
               when 'vocabulary' then vocabulary
               when 'grammar' then grammar
               end
    end

    # Update a user review for a correct review
    # @return [UserReviewKanji, UserReviewVocabulary, UserReviewGrammar] The user review
    def correct_review
      ActiveRecord::Base.transaction do
        user_review = find_or_create_user_review

        if user_review.new_record?
          user_review.assign_attributes(
            memorization_status: :level_0,
            number_of_total_reviews: 0,
            number_of_correct_reviews: 0,
            next_review_at: calculate_next_review_date(memorization_status: 0)
          )

          user_review.save!
        else
          user_review.increment!(:number_of_total_reviews)
          user_review.increment!(:number_of_correct_reviews)

          new_memorization_status = user_review.memorization_status_before_type_cast + 1

          max_memorization_status = case point_exercise_type
                                    when 'kanji' then UserReviewKanji.memorization_statuses.values.max
                                    when 'vocabulary' then UserReviewVocabulary.memorization_statuses.values.max
                                    when 'grammar' then UserReviewGrammar.memorization_statuses.values.max
                                    end

          new_memorization_status = max_memorization_status if new_memorization_status > max_memorization_status

          user_review.update!(
            memorization_status: new_memorization_status,
            next_review_at: calculate_next_review_date(memorization_status: new_memorization_status)
          )
        end

        user_review
      end
    end

    # Update a user review for an incorrect review
    # @return [UserReviewKanji, UserReviewVocabulary, UserReviewGrammar] The user review
    def incorrect_review
      ActiveRecord::Base.transaction do
        user_review = find_or_create_user_review

        user_review.increment!(:number_of_total_reviews)

        # Decrease the memorization status by 1, but don't go below 0
        new_status = [user_review.memorization_status_before_type_cast - 1, 0].max

        user_review.update!(
          memorization_status: new_status,
          next_review_at: calculate_next_review_date(memorization_status: 0)
        )

        user_review
      end
    end

    private

    # Find or create a user review for a point exercise
    # @return [UserReviewKanji, UserReviewVocabulary, UserReviewGrammar] The user review
    def find_or_create_user_review
      course = Course.find_by!(slug: course_slug)
      user_course = user.user_courses.find_or_create_by!(course: course)

      course_level = case point_exercise_type
                     when 'kanji' then course.course_level_kanjis.find_by!(position: position)
                     when 'vocabulary' then course.course_level_vocabularies.find_by!(position: position)
                     when 'grammar' then course.course_level_grammars.find_by!(position: position)
                     end

      user_course_level = case point_exercise_type
                        when 'kanji' then user_course.user_course_level_kanjis.find_or_create_by!(course_level_kanji: course_level)
                        when 'vocabulary' then user_course.user_course_level_vocabularies.find_or_create_by!(course_level_vocabulary: course_level)
                        when 'grammar' then user_course.user_course_level_grammars.find_or_create_by!(course_level_grammar: course_level)
                        end

      course_level_link = case point_exercise_type
                        when 'kanji' then course_level.course_level_kanji_links.find_by!(kanji: point)
                        when 'vocabulary' then course_level.course_level_vocabulary_links.find_by!(vocabulary: point)
                        when 'grammar' then course_level.course_level_grammar_links.find_by!(grammar: point)
                        end

      user_course_level_link = case point_exercise_type
                               when 'kanji' then user_course_level.user_course_level_kanji_links.find_or_create_by!(course_level_kanji_link: course_level_link  )
                               when 'vocabulary' then user_course_level.user_course_level_vocabulary_links.find_or_create_by!(course_level_vocabulary_link: course_level_link)
                               when 'grammar' then user_course_level.user_course_level_grammar_links.find_or_create_by!(course_level_grammar_link: course_level_link)
                               end

      point_exercise = case point_exercise_type
                        when 'kanji' then course_level.kanji_exercises.find_by!(id: point_exercise_id)
                        when 'vocabulary' then course_level.vocabulary_exercises.find_by!(id: point_exercise_id)
                        when 'grammar' then course_level.grammar_exercises.find_by!(id: point_exercise_id)
                        end

      point = case point_exercise_type
              when 'kanji' then point_exercise.kanji
              when 'vocabulary' then point_exercise.vocabulary
              when 'grammar' then point_exercise.grammar
              end

      user_review = case point_exercise_type
                    when 'kanji' then user_course_level_link.user_review_kanjis.find_or_initialize_by(kanji_exercise: point_exercise, kanji: point)
                    when 'vocabulary' then user_course_level_link.user_review_vocabularies.find_or_initialize_by(vocabulary_exercise: point_exercise, vocabulary: point)
                    when 'grammar' then user_course_level_link.user_review_grammars.find_or_initialize_by(grammar_exercise: point_exercise, grammar: point)
                    end

      user_review
    end

    # Calculate the next review date for a user review
    # @param memorization_status [Integer] The memorization status
    # @return [Time] The next review date
    def calculate_next_review_date(memorization_status:)
      case memorization_status
      when 0 then 4.hours.from_now   # Level 0: Review in 4 hours
      when 1 then 8.hours.from_now   # Level 1: Review in 8 hours
      when 2 then 1.day.from_now     # Level 2: Review in 1 day
      when 3 then 2.days.from_now    # Level 3: Review in 2 days
      when 4 then 1.week.from_now    # Level 4: Review in 1 week
      when 5 then 2.weeks.from_now   # Level 5: Review in 2 weeks
      else 1.month.from_now          # Level 6: Review in 1 month
      end
    end
  end
end