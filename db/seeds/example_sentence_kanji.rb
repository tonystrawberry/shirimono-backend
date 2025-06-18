# db/seeds/example_sentence_kanji.rb
example_sentences = ExampleSentence.all.to_a
Kanji.find_each do |kanji|
  example_sentences.sample(3).each do |sentence|
    ExampleSentenceKanji.find_or_create_by!(kanji: kanji, example_sentence: sentence)
  end
end