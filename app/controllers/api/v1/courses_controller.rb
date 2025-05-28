module Api
  module V1
    class CoursesController < ApplicationController
      before_action :authenticate_user!

      def index
        @courses = Course.order(:id)
      end
    end
  end
end