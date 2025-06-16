json.course_levels @course_levels do |course_level|
  json.extract! course_level, :id, :title, :description, :position, :point_type

  json.course do
    json.extract! course_level.course, :id, :title, :slug
  end
end