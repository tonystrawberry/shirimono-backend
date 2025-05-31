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
          @kanji_exercises = KanjiExercise.where(
            kanji_id: @kanjis.pluck(:id),
            unlock_mastery_level: KanjiExercise.unlock_mastery_levels[:beginner]
          )
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