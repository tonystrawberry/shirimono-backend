 json.point_of_the_day do
  json.id @point_of_the_day.id
  json.featured_on @point_of_the_day.featured_on

  json.point do
    json.id @point_of_the_day.point.id
    json.type @point_of_the_day.point_type.downcase
    json.title @point_of_the_day.point.title
    json.meanings @point_of_the_day.point.meanings

    # Add type-specific attributes
    case @point_of_the_day.point
    when Kanji
      json.kunyomi_readings @point_of_the_day.point.kunyomi_readings
      json.onyomi_readings @point_of_the_day.point.onyomi_readings
    when Vocabulary
      json.kana @point_of_the_day.point.kana
      json.types @point_of_the_day.point.types
    end

    # Include example sentences
    json.example_sentences @point_of_the_day.point.example_sentences do |example|
      json.id example.id
      json.sentence example.sentence
      json.sentence_html example.sentence_html
      json.translation example.translation
    end
  end
end