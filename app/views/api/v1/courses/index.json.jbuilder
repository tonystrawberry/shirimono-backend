json.courses @courses do |course|
  json.id course.id
  json.slug course.slug
  json.title course.title

  json.kanjis_count course.kanjis_count
  json.grammars_count course.grammars_count
  json.vocabularies_count course.vocabularies_count

  json.course_level_kanjis_count course.course_level_kanjis_count
  json.course_level_vocabularies_count course.course_level_vocabularies_count
  json.course_level_grammars_count course.course_level_grammars_count

  json.progress do
    json.kanjis_count course.progress[:kanjis_count]
    json.grammars_count course.progress[:grammars_count]
    json.vocabularies_count course.progress[:vocabularies_count]
  end
end