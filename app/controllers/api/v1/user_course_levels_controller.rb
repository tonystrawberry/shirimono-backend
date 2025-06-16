module Api
  module V1
    class UserCourseLevelsController < ApplicationController
      before_action :authenticate_user!

      # GET /api/v1/user_course_levels
      def index
        @user_course_levels = current_user.user_course_levels.includes(:course_level)
      end
    end
  end
end
