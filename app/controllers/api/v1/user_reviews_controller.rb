module Api
  module V1
    class UserReviewsController < ApplicationController
      before_action :authenticate_user!

      def index
        @user_reviews = UserReview.joins(user_course: :course)
                                .includes(user_course: :course, course_point: {})
                                .where(user_courses: { user_id: current_user.id })
                                .order(:next_review_at)
      end
    end
  end
end