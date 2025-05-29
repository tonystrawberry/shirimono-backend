json.course do
  json.id @course.id
  json.title @course.title
  json.slug @course.slug
  json.course_level_kanjis_count @course.course_levels.where(point_type: :kanji).count
  json.course_level_vocabularies_count @course.course_levels.where(point_type: :vocabulary).count
  json.course_level_grammars_count @course.course_levels.where(point_type: :grammar).count

  json.levels @levels do |level|
    json.id level.id
    json.title level.title
    json.description level.description
    json.position level.position

    json.points case params[:point_type].to_sym
                when :kanji
                  level.kanjis.map { |k| { id: k.id, title: k.title, meanings: k.meanings } }
                when :vocabulary
                  level.vocabularies.map { |v| { id: v.id, title: v.title, meanings: v.meanings } }
                when :grammar
                  level.grammars.map { |g| { id: g.id, title: g.title, meanings: g.meanings } }
                end
  end
end