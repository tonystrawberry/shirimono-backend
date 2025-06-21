module Api
  module V1
    class UserReviewsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_user_review, only: [:incorrect_review]

      def index
        @user_review_kanjis = UserReviewKanji
          .joins(user_course_level_kanji_link: { user_course_level_kanji: :user_course })
          .where(user_course_level_kanji_link: { user_course_level_kanji: { user_courses: { user_id: current_user.id } } })
          .order(next_review_at: :asc)
          .decorate

        @user_review_vocabularies = UserReviewVocabulary
          .joins(user_course_level_vocabulary_link: { user_course_level_vocabulary: :user_course })
          .where(user_course_level_vocabulary_link: { user_course_level_vocabulary: { user_courses: { user_id: current_user.id } } })
          .order(next_review_at: :asc)
          .decorate

        @user_review_grammars = UserReviewGrammar
          .joins(user_course_level_grammar_link: { user_course_level_grammar: :user_course })
          .where(user_course_level_grammar_link: { user_course_level_grammar: { user_courses: { user_id: current_user.id } } })
          .order(next_review_at: :asc)
          .decorate
      end

      # POST /api/v1/user_reviews/correct_review
      def correct_review
        puts "course_slug: #{params[:course_slug]}"
        puts "level: #{params[:position]}"
        puts "point_exercise_type: #{params[:point_exercise_type]}"
        puts "point_exercise_id: #{params[:point_exercise_id]}"

        service = UserReviews::UpdateService.new(
          user: current_user,
          course_slug: params[:course_slug],
          position: params[:position],
          point_exercise_type: params[:point_exercise_type],
          point_exercise_id: params[:point_exercise_id]
        )

        @user_review = service.correct_review.decorate

        UserCourseLevels::UpdateStatusService.new(user: current_user, course_slug: params[:course_slug], point_type: params[:point_exercise_type]).call
        # UserCourseLevels::InitializeUserCourseLevelsService.new(user: current_user, course: Course.find_by(slug: params[:course_slug]), type: params[:point_exercise_type]).call

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
          course_slug: @user_review.user_course_level.user_course.course.slug,
          position: @user_review.user_course_level.position,
          point_exercise_type: @user_review.point_exercise_type,
          point_exercise_id: @user_review.point_exercise_id
        )

        @user_review = service.incorrect_review(@user_review).decorate

        render :show
      rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

      # GET /api/v1/user_reviews/due_reviews
      def due_reviews
        @user_review_kanjis = current_user.user_review_kanjis.where(next_review_at: ..Time.current).includes(kanji_exercise: :kanji).decorate
        @user_review_vocabularies = UserReviewVocabulary.where(next_review_at: ..Time.current).includes(vocabulary_exercise: :vocabulary).decorate
        @user_review_grammars = UserReviewGrammar.where(next_review_at: ..Time.current).includes(grammar_exercise: :grammar).decorate
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