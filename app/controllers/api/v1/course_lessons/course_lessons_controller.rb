module Api
  module V1
    module CourseLessons
      class CourseLessonsController < ApplicationController
        before_action :authenticate_user!
        before_action :set_course
        before_action :set_course_level, only: [:kanjis, :vocabularies, :grammars]

        # GET /api/v1/courses/:slug/course_lessons/kanjis/:position
        def kanjis
          @course_level = @course.course_levels.find_by!(
            point_type: :kanji,
            position: params[:position]
          )
          @kanjis = @course_level.kanjis.includes(:kanji_exercises)

          # Get all beginner exercises for these kanjis
          @kanji_exercises = KanjiExercise.where(
            kanji_id: @kanjis.pluck(:id),
            unlock_mastery_level: KanjiExercise.unlock_mastery_levels[:beginner]
          )

          # Get existing user reviews for these exercises in this course
          @already_reviewed_kanji_exercises = current_user.user_reviews.where(
            user_course: current_user.user_courses.where(course: @course),
            point_exercise_type: "KanjiExercise",
            point_exercise_id: @kanji_exercises.pluck(:id)
          )

          puts "already_reviewed_kanji_exercises: #{@already_reviewed_kanji_exercises.inspect}"

          @kanji_exercises = @kanji_exercises.where.not(id: @already_reviewed_kanji_exercises.pluck(:point_exercise_id))
        end

        # GET /api/v1/courses/:slug/course_lessons/vocabularies/:position
        def vocabularies
          @course_level = @course.course_levels.find_by!(
            point_type: :vocabulary,
            position: params[:position]
          )
          @vocabularies = @course_level.vocabularies.includes(:vocabulary_exercises)
          @vocabulary_exercises = VocabularyExercise.where(
            vocabulary_id: @vocabularies.pluck(:id),
            unlock_mastery_level: VocabularyExercise.unlock_mastery_levels[:beginner]
          )

          @already_reviewed_vocabulary_exercises = current_user.user_reviews.where(
            user_course: current_user.user_courses.where(course: @course),
            point_exercise_type: "VocabularyExercise",
            point_exercise_id: @vocabulary_exercises.pluck(:id)
          )

          puts "already_reviewed_vocabulary_exercises: #{@already_reviewed_vocabulary_exercises.inspect}"

          @vocabulary_exercises = @vocabulary_exercises.where.not(id: @already_reviewed_vocabulary_exercises.pluck(:point_exercise_id))
        end

        # GET /api/v1/courses/:slug/course_lessons/grammars/:position
        def grammars
          @course_level = @course.course_levels.find_by!(
            point_type: :grammar,
            position: params[:position]
          )
          @grammars = @course_level.grammars.includes(:grammar_exercises)
          @grammar_exercises = GrammarExercise.where(
            grammar_id: @grammars.pluck(:id),
            unlock_mastery_level: GrammarExercise.unlock_mastery_levels[:beginner]
          )

          @already_reviewed_grammar_exercises = current_user.user_reviews.where(
            user_course: current_user.user_courses.where(course: @course),
            point_exercise_type: "GrammarExercise",
            point_exercise_id: @grammar_exercises.pluck(:id)
          )

          @grammar_exercises = @grammar_exercises.where.not(id: @already_reviewed_grammar_exercises.pluck(:point_exercise_id))
        end

        private

        def set_course
          @course = Course.find_by!(slug: params[:course_slug])
        end

        def set_course_level
          point_type = action_name.to_sym

        end
      end
    end
  end
end