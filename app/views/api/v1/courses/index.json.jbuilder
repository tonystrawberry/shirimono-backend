json.courses @courses do |course|
  json.extract! course, :id, :slug
  json.title course.title
  json.kanjis_count course.kanjis_count
  json.grammars_count course.grammars_count
  json.vocabularies_count course.vocabularies_count
  json.course_level_kanjis_count course.course_levels.where(point_type: :kanji).count
  json.course_level_vocabularies_count course.course_levels.where(point_type: :vocabulary).count
  json.course_level_grammars_count course.course_levels.where(point_type: :grammar).count

  json.created_at course.created_at
  json.updated_at course.updated_at
end