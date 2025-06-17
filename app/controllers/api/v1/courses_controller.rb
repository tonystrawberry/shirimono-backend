module Api
  module V1
    class CoursesController < ApplicationController
      before_action :authenticate_user!

      # GET /api/v1/courses
      def index
        @courses = Course.order(:id).decorate
      end

      # GET /api/v1/courses/:slug
      def show
        point_type = params[:point_type]&.to_sym

        @course = Course.includes(:translations).find_by!(slug: params[:slug])
        @user_course = current_user.user_courses.find_by(course: @course)

        case point_type
        when :kanji
          @user_course_levels = @user_course.user_course_level_kanjis.decorate
          @course_levels = @course.course_level_kanjis.order(:position).decorate
          @user_reviews = current_user.user_reviews.where(course_point_type: "CourseLevelKanji").decorate
        when :vocabulary
          @user_course_levels = @user_course.user_course_level_vocabularies.decorate
          @course_levels = @course.course_level_vocabularies.order(:position).decorate
          @user_reviews = current_user.user_reviews.where(course_point_type: "CourseLevelVocabulary").decorate
        when :grammar
          @user_course_levels = @user_course.user_course_level_grammars.decorate
          @course_levels = @course.course_level_grammars.order(:position).decorate
          @user_reviews = current_user.user_reviews.where(course_point_type: "CourseLevelGrammar").decorate
        end
      end
    end
  end
end