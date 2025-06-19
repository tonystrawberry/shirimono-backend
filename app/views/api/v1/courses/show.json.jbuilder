json.course do
  json.id @course.id
  json.title @course.title
  json.slug @course.slug

  json.course_level_kanjis_count @course.course_level_kanjis.count
  json.course_level_vocabularies_count @course.course_level_vocabularies.count
  json.course_level_grammars_count @course.course_level_grammars.count

  json.course_levels @course_levels do |course_level|
    json.id course_level.id
    json.title course_level.title
    json.description course_level.description
    json.position course_level.position

    json.points course_level.points

    json.progress do
      json.kanjis_count @user_course&.kanjis_count || 0
      json.grammars_count @user_course&.grammars_count || 0
      json.vocabularies_count @user_course&.vocabularies_count || 0
    end
  end
end