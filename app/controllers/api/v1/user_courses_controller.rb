module Api
  module V1
    class UserCoursesController < ApplicationController
      before_action :authenticate_user!

      def index
        @user_courses = current_user.user_courses.includes(:course)
      end
    end
  end
end