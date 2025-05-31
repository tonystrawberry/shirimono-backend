module Api
  module V1
    class CourseLessonsController < ApplicationController
      before_action :set_course
      before_action :set_course_level, only: [:kanjis, :vocabularies, :grammars]

      # GET /api/v1/courses/:slug/course_lessons/kanjis/:position
      def kanjis
        @kanjis = @course_level.kanjis.includes(:kanji_exercises)
        @kanji_exercises = KanjiExercise.where(
          kanji_id: @kanjis.pluck(:id),
          unlock_mastery_level: KanjiExercise.unlock_mastery_levels[:beginner]
        )
      end

      # GET /api/v1/courses/:slug/course_lessons/vocabularies/:position
      def vocabularies
        @vocabularies = @course_level.vocabularies.includes(:vocabulary_exercises)
        @vocabulary_exercises = VocabularyExercise.where(
          vocabulary_id: @vocabularies.pluck(:id),
          unlock_mastery_level: VocabularyExercise.unlock_mastery_levels[:beginner]
        )
      end

      # GET /api/v1/courses/:slug/course_lessons/grammars/:position
      def grammars
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
        @course_level = @course.course_levels.find_by!(
          point_type: point_type,
          position: params[:position]
        )
      end
    end
  end
end
