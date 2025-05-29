json.courses @courses do |course|
  json.extract! course, :id, :slug
  json.title course.title
  json.kanjis_count course.kanjis_count
  json.grammars_count course.grammars_count
  json.vocabularies_count course.vocabularies_count

  json.created_at course.created_at
  json.updated_at course.updated_at
end