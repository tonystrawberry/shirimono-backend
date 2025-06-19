module Api
  module V1
    class UserCourseLevelsController < ApplicationController
      before_action :authenticate_user!

      # GET /api/v1/user_course_levels
      def index
        @user_courses = current_user.user_courses
        @user_course_level_kanjis = UserCourseLevelKanji.where(user_course_id: @user_courses.pluck(:id))
        @user_course_level_vocabularies = UserCourseLevelVocabulary.where(user_course_id: @user_courses.pluck(:id))
        @user_course_level_grammars = UserCourseLevelGrammar.where(user_course_id: @user_courses.pluck(:id))
      end
    end
  end
end