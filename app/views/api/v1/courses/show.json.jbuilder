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

    points = case params[:point_type].to_sym
            when :kanji
              level.kanjis.map { |kanji|
                {
                  id: kanji.id,
                  title: kanji.title,
                  meanings: kanji.meanings,
                  kunyomi_readings: kanji.kunyomi_readings,
                  onyomi_readings: kanji.onyomi_readings,
                  exercises: kanji.kanji_exercises.map { |exercise| { id: exercise.id } },
                }
              }
            when :vocabulary
              level.vocabularies.map { |vocabulary|
                {
                  id: vocabulary.id,
                title: vocabulary.title,
                  meanings: vocabulary.meanings,
                  exercises: vocabulary.vocabulary_exercises.map { |exercise| { id: exercise.id } }
                }
              }
            when :grammar
              level.grammars.map { |grammar|
                {
                  id: grammar.id,
                  title: grammar.title,
                  meanings: grammar.meanings,
                  exercises: grammar.grammar_exercises.map { |exercise| { id: exercise.id } }
                }
              }
            end

    json.points points

    json.progress do
      json.kanjis_count current_user.user_courses.find_by(course: @course)&.kanjis_count || 0
      json.grammars_count current_user.user_courses.find_by(course: @course)&.grammars_count || 0
      json.vocabularies_count current_user.user_courses.find_by(course: @course)&.vocabularies_count || 0
    end
  end
end