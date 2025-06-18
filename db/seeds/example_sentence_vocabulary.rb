# db/seeds/example_sentence_vocabulary.rb
example_sentences = ExampleSentence.all.to_a
Vocabulary.find_each do |vocabulary|
  example_sentences.sample(3).each do |sentence|
    ExampleSentenceVocabulary.find_or_create_by!(vocabulary: vocabulary, example_sentence: sentence)
  end
end