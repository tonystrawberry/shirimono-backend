module Api
  module V1
    class CourseLevelsController < ApplicationController
      before_action :authenticate_user!

      # GET /api/v1/course_levels/:course_slug/:position
      def index
        @course = Course.find_by!(slug: params[:course_slug])
        @course_level = @course.course_levels.find_by!(position: params[:position], point_type: params[:point_type])

        @course_levels = @course.course_levels.where(point_type: params[:point_type])
      end

      # GET /api/v1/course_levels/:course_slug/course_levels/:point_type/:position
      def show
        @course = Course.find_by!(slug: params[:course_slug])

        case params[:point_type]
        when "kanji"
          @course_level = @course.course_level_kanjis.find_by!(position: params[:position])
          @points = @course_level.kanjis.includes(:translations, :example_sentences, :related_kanjis_as_kanji_1, :related_kanjis_as_kanji_2, :kanji_exercises)
        when "vocabulary"
          @course_level = @course.course_level_vocabularies.find_by!(position: params[:position])
          @points = @course_level.vocabularies.includes(:translations, :example_sentences, :synonyms_as_vocabulary_1, :synonyms_as_vocabulary_2, :antonyms_as_vocabulary_1, :antonyms_as_vocabulary_2, :vocabulary_exercises)
        when "grammar"
          @course_level = @course.course_level_grammars.find_by!(position: params[:position])
          @points = @course_level.grammars.includes(:translations, :example_sentences, :grammar_exercises)
        end

        # @points = case params[:point_type]
        #          when :kanji
        #            @course_level.kanjis.includes(:translations, :example_sentences, :related_kanjis_as_kanji_1, :related_kanjis_as_kanji_2, :kanji_exercises)
        #          when :vocabulary
        #            @course_level.vocabularies.includes(:translations, :example_sentences,
        #              :synonyms_as_vocabulary_1, :synonyms_as_vocabulary_2,
        #              :antonyms_as_vocabulary_1, :antonyms_as_vocabulary_2,
        #              :vocabulary_exercises)
        #          when :grammar
        #            @course_level.grammars.includes(:translations, :example_sentences, :grammar_exercises)
        #          end
      end
    end
  end
end