module Api
  module V1
    class UserCoursesController < ApplicationController
      before_action :authenticate_user!

      # GET /api/v1/user_courses
      def index
        @user_courses = current_user.user_courses.includes(:course).decorate
      end
    end
  end
end