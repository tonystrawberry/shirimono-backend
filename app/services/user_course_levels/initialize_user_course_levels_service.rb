module UserCourseLevels
  class InitializeUserCourseLevelsService
    def initialize(user:, course:, type:)
      @user = user
      @course = course
      @type = type
    end

    # Initialize user course levels for a given user and course
    # If there is already a user course level with :ready status, do nothing
    # If there is no user course level, create a new one with :ready status
    # If the latest user course level is :done and there is no next course level, create a new one with :ready status at the next level
    def call
      user_course = @user.user_courses.find_or_create_by!(course: @course)

      puts "course: #{@course.inspect}"
      puts "type: #{@type}"
      course_levels = @course.course_levels.where(point_type: @type).order(position: :asc)

      user_course_levels = user_course.user_course_levels.joins(:course_level)
        .where(course_levels: { point_type: @type })
        .order('course_levels.position ASC')

      # If there is no user course level, create a new one with :ready status
      if user_course_levels.empty?
        user_course.user_course_levels.create!(status: :ready, course_level: course_levels.first)
        return
      end

      next_course_level = course_levels.where('position > ?', user_course_levels.last.course_level.position).order(position: :asc).first
      # If the latest user course level is :done and there is no next course level, create a new one with :ready status at the next level
      if [:ready, :lessons_not_completed].exclude?(user_course_levels.last.status) && next_course_level.present?
        user_course.user_course_levels.create!(status: :ready, course_level: next_course_level)
        return
      end

      # If the latest user course level is :done and there is a next course level, do nothing

      # If some course_level is missing between the first and the last user course level, create a new one with :ready status at the missing level
      # For each course_level, check if it has a user course level with :ready status
      # If it doesn't, create a new one with :ready status
      course_levels
        .where.not(id: user_course_levels.pluck(:course_level_id)).where(position: 0..user_course_levels.last.course_level.position)
        .order(position: :asc)
        .each do |course_level|
          user_course.user_course_levels.create!(status: :ready, course_level: course_level)
        end
    end
  end
end