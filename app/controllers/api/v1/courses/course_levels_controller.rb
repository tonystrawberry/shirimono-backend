module Api
  module V1
    module Courses
      class CourseLevelsController < ApplicationController
        before_action :authenticate_user!

        # GET /api/v1/courses/:slug/course_levels/kanjis
        def index_kanjis
          @course_level_kanjis = @course.course_level_kanjis.order(:position).decorate
          @user_course_level_kanjis = current_user.user_course_level_kanjis.where(course_level_kanji: @course_level_kanjis).decorate
        end

        # GET /api/v1/courses/:slug/course_levels/vocabularies
        def index_vocabularies
          @course_level_vocabularies = @course.course_level_vocabularies.order(:position).decorate
          @user_course_level_vocabularies = current_user.user_course_level_vocabularies.where(course_level_vocabulary: @course_level_vocabularies).decorate
        end

        # GET /api/v1/courses/:slug/course_levels/grammars
        def index_grammars
          @course_level_grammars = @course.course_level_grammars.order(:position).decorate
          @user_course_level_grammars = current_user.user_course_level_grammars.where(course_level_grammar: @course_level_grammars).decorate
        end

        # GET /api/v1/courses/:slug/course_levels/kanjis/:position
        def show_kanjis
          @course_level_kanji = @course.course_level_kanjis.find_by!(position: params[:position]).decorate
          @user_course_level_kanji = current_user.user_course_level_kanjis.find_by!(course_level_kanji: @course_level_kanji).decorate
        end

        # GET /api/v1/courses/:slug/course_levels/vocabularies/:position
        def show_vocabularies
          @course_level_vocabulary = @course.course_level_vocabularies.find_by!(position: params[:position]).decorate
          @user_course_level_vocabulary = current_user.user_course_level_vocabularies.find_by!(course_level_vocabulary: @course_level_vocabulary).decorate
        end

        # GET /api/v1/courses/:slug/course_levels/grammars/:position
        def show_grammars
          @course_level_grammar = @course.course_level_grammars.find_by!(position: params[:position]).decorate
          @user_course_level_grammar = current_user.user_course_level_grammars.find_by!(course_level_grammar: @course_level_grammar).decorate
        end

        private

        # Set the course based on the `:course_slug` parameter
        def set_course
          @course = Course.find_by!(slug: params[:course_slug])
        end
      end
    end
  end
end
