module Api
  module V1
    class CoursesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_course, only: [:show]

      def index
        @courses = Course.order(:id).decorate
      end

      def show
        point_type = params[:point_type]&.to_sym
        unless CourseLevel.point_types.key?(point_type)
          return render json: { error: "Invalid point type. Must be one of: #{CourseLevel.point_types.keys.join(', ')}" },
                        status: :unprocessable_entity
        end

        @user_course = current_user.user_courses.find_by(course: @course)

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

        @user_course_levels = current_user.user_course_levels.where(course_level: @levels)

        @user_reviews_kanjis = current_user.user_reviews.where(course_point_type: "CourseLevelKanji")
        @user_reviews_vocabularies = current_user.user_reviews.where(course_point_type: "CourseLevelVocabulary")
        @user_reviews_grammars = current_user.user_reviews.where(course_point_type: "CourseLevelGrammar")
      end

      private

      def set_course
        @course = Course.includes(:translations).find_by!(slug: params[:slug])
      end
    end
  end
end