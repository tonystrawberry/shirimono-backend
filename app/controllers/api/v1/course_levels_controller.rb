module Api
  module V1
    class CourseLevelsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_course
      before_action :validate_point_type
      before_action :set_course_level

      # GET /api/v1/course_levels/:course_slug/:position
      def index
        @course_levels = @course.course_levels.where(point_type: @point_type)
      end

      def show
        @points = case @point_type
                 when :kanji
                   @course_level.kanjis.includes(:translations, :example_sentences, :related_kanjis_as_kanji_1, :related_kanjis_as_kanji_2, :kanji_exercises)
                 when :vocabulary
                   @course_level.vocabularies.includes(:translations, :example_sentences,
                     :synonyms_as_vocabulary_1, :synonyms_as_vocabulary_2,
                     :antonyms_as_vocabulary_1, :antonyms_as_vocabulary_2,
                     :vocabulary_exercises)
                 when :grammar
                   @course_level.grammars.includes(:translations, :example_sentences, :grammar_exercises)
                 end
      end

      private

      def set_course
        @course = Course.find_by!(slug: params[:course_slug])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Course not found' }, status: :not_found
      end

      def set_course_level
        @course_level = @course.course_levels.find_by!(position: params[:position], point_type: @point_type)
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Course level not found' }, status: :not_found
      end

      def validate_point_type
        @point_type = params[:point_type]&.to_sym
        unless CourseLevel.point_types.key?(@point_type)
          render json: {
            error: "Invalid point type. Must be one of: #{CourseLevel.point_types.keys.join(', ')}"
          }, status: :unprocessable_entity
        end
      end
    end
  end
end