json.course do
  json.extract! @course, :id, :slug
  json.title @course.title

  json.levels @levels do |level|
    json.extract! level, :id, :position
    json.title level.title
    json.description level.description

    json.points case level.point_type.to_sym
                when :kanji
                  level.kanjis.map do |kanji|
                    {
                      id: kanji.id,
                      title: kanji.title,
                      meaning: kanji.meaning
                    }
                  end
                when :vocabulary
                  level.vocabularies.map do |vocabulary|
                    {
                      id: vocabulary.id,
                      title: vocabulary.title,
                      meaning: vocabulary.meaning
                    }
                  end
                when :grammar
                  level.grammars.map do |grammar|
                    {
                      id: grammar.id,
                      title: grammar.title,
                      meaning: grammar.meaning
                    }
                  end
                end
  end
end