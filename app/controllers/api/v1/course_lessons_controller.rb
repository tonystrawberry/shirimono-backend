module Api
  module V1
    class CourseLessonsController < ApplicationController
      before_action :authenticate_user!

      before_action :set_course

      # GET /api/v1/courses/:slug/course_lessons/kanjis/:position
      def kanjis
        @course = Course.find_by!(slug: params[:course_slug])
        @kanjis = @course
                    .course_level_kanjis
                    .find_by!(position: params[:position])
                    .kanjis

        @kanji_exercises = KanjiExercise.where(
          kanji_id: @kanjis.pluck(:id),
          unlock_mastery_level: KanjiExercise.unlock_mastery_levels[:beginner]
        )
      end

      # GET /api/v1/courses/:slug/course_lessons/vocabularies/:position
      def vocabularies
        @course = Course.find_by!(slug: params[:course_slug])
        @vocabularies = @course
                    .course_level_vocabularies
                    .find_by!(position: params[:position])
                    .vocabularies

        @vocabulary_exercises = VocabularyExercise.where(
          vocabulary_id: @vocabularies.pluck(:id),
          unlock_mastery_level: VocabularyExercise.unlock_mastery_levels[:beginner]
        )
      end

      # GET /api/v1/courses/:slug/course_lessons/grammars/:position
      def grammars
        @course = Course.find_by!(slug: params[:course_slug])
        @grammars = @course
                    .course_level_grammars
                    .find_by!(position: params[:position])
                    .grammars

        @grammar_exercises = GrammarExercise.where(
          grammar_id: @grammars.pluck(:id),
          unlock_mastery_level: GrammarExercise.unlock_mastery_levels[:beginner]
        )
      end
    end
  end
end
