json.user_course_level_kanjis @user_course_level_kanjis do |user_course_level_kanji|
  json.extract! user_course_level_kanji, :id, :status, :created_at, :updated_at

  json.course_level_kanji do
    json.extract! user_course_level_kanji.course_level_kanji,
      :id, :title, :description, :position, :course_level_kanji_links_count

    json.course do
      json.extract! user_course_level_kanji.course_level_kanji.course, :id, :title, :slug
    end
  end
end

json.user_course_level_vocabularies @user_course_level_vocabularies do |user_course_level_vocabulary|
  json.extract! user_course_level_vocabulary, :id, :status, :created_at, :updated_at

  json.course_level_vocabulary do
    json.extract! user_course_level_vocabulary.course_level_vocabulary,
      :id, :title, :description, :position, :course_level_vocabulary_links_count

    json.course do
      json.extract! user_course_level_vocabulary.course_level_vocabulary.course, :id, :title, :slug
    end
  end
end

json.user_course_level_grammars @user_course_level_grammars do |user_course_level_grammar|
  json.extract! user_course_level_grammar, :id, :status, :created_at, :updated_at

  json.course_level_grammar do
    json.extract! user_course_level_grammar.course_level_grammar,
      :id, :title, :description, :position, :course_level_grammar_links_count

    json.course do
      json.extract! user_course_level_grammar.course_level_grammar.course, :id, :title, :slug
    end
  end
end