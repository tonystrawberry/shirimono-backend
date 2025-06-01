module Api
  module V1
    class UserReviewsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_user_review, only: [:incorrect_review]

      def index
        @user_reviews = UserReview.joins(user_course: :course)
                                .includes(user_course: :course, course_point: {}, point_exercise: {})
                                .where(user_courses: { user_id: current_user.id })
                                .order(:next_review_at)
      end

      # POST /api/v1/user_reviews/correct_review
      def correct_review
        service = UserReviews::UpdateService.new(
          user: current_user,
          course_slug: params[:course_slug],
          course_point_type: params[:course_point_type],
          course_point_id: params[:course_point_id],
          point_exercise_type: params[:point_exercise_type],
          point_exercise_id: params[:point_exercise_id]
        )

        @user_review = service.correct_review
        render :show
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Course or course point not found' }, status: :not_found
      rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

      # POST /api/v1/user_reviews/:id/incorrect_review
      def incorrect_review
        service = UserReviews::UpdateService.new(
          user: current_user,
          course_slug: @user_review.user_course.course.slug,
          course_point_type: @user_review.course_point_type,
          course_point_id: @user_review.course_point_id,
          point_exercise_type: @user_review.point_exercise_type,
          point_exercise_id: @user_review.point_exercise_id
        )

        @user_review = service.incorrect_review(@user_review)
        render :show
      rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

      private

      def set_user_review
        @user_review = current_user.user_reviews.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'User review not found' }, status: :not_found
      end
    end
  end
end