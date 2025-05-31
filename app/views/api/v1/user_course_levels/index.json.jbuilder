json.user_course_levels @user_course_levels do |user_course_level|
  json.extract! user_course_level, :id, :status, :created_at, :updated_at

  json.course_level do
    json.extract! user_course_level.course_level,
      :id, :title, :description, :position, :point_type, :course_points_count

    json.course do
      json.extract! user_course_level.course_level.course, :id, :title, :slug
    end
  end
end