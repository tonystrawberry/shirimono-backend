module Api
  module V1
    class UserCourseLevelsController < ApplicationController
      before_action :authenticate_user!

      # GET /api/v1/user_course_levels
      def index
        @user_courses = current_user.user_courses
        @user_course_levels = UserCourseLevel.where(user_course_id: @user_courses.pluck(:id)).includes(:course_level)
      end
    end
  end
end
