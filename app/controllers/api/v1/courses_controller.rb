module Api
  module V1
    class CoursesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_course, only: [:show]

      def index
        @courses = Course.order(:id)
      end

      def show
        point_type = params[:point_type]&.to_sym
        unless CourseLevel.point_types.key?(point_type)
          return render json: { error: "Invalid point type. Must be one of: #{CourseLevel.point_types.keys.join(', ')}" },
                        status: :unprocessable_entity
        end

        @levels = @course.course_levels
                        .where(point_type: point_type)
                        .includes(:translations)
                        .order(:position)

        # Include the appropriate points based on point_type
        @levels = case point_type
                 when :kanji
                   @levels.includes(kanjis: :translations)
                 when :vocabulary
                   @levels.includes(vocabularies: :translations)
                 when :grammar
                   @levels.includes(grammars: :translations)
                 end
      end

      private

      def set_course
        @course = Course.includes(:translations).find_by!(slug: params[:id])
      end
    end
  end
end