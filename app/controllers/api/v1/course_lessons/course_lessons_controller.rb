module Api
  module V1
    module CourseLessons
      class CourseLessonsController < ApplicationController
        before_action :authenticate_user!

        # GET /api/v1/courses/:slug/course_lessons/kanjis/:position
        def kanjis
          @course = Course.find_by!(slug: params[:course_slug])
          @course_level_kanji = @course.course_level_kanjis.find_by!(position: params[:position])
          @kanjis = @course_level_kanji.kanjis.includes(:kanji_exercises)

          @kanji_exercises = KanjiExercise.where(
            kanji_id: @kanjis.pluck(:id),
            unlock_mastery_level: KanjiExercise.unlock_mastery_levels[:beginner]
          )

          @already_reviewed_kanji_exercises = current_user.user_review_kanjis.where(
            user_course_level_kanji_link: current_user.user_courses.where(course: @course).map(&:user_course_level_kanji_links).flatten,
            kanji_exercise_id: @kanji_exercises.pluck(:id)
          )

          @kanji_exercises = @kanji_exercises.where.not(id: @already_reviewed_kanji_exercises.pluck(:kanji_exercise_id))
        end

        # GET /api/v1/courses/:slug/course_lessons/vocabularies/:position
        def vocabularies
          @course = Course.find_by!(slug: params[:course_slug])
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

          @vocabulary_exercises = @vocabulary_exercises.where.not(id: @already_reviewed_vocabulary_exercises.pluck(:vocabulary_exercise_id))
        end

        # GET /api/v1/courses/:slug/course_lessons/grammars/:position
        def grammars
          @course = Course.find_by!(slug: params[:course_slug])
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

          @grammar_exercises = @grammar_exercises.where.not(id: @already_reviewed_grammar_exercises.pluck(:grammar_exercise_id))
        end
      end
    end
  end
end