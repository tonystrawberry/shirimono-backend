# db/seeds/example_sentence_grammar.rb
example_sentences = ExampleSentence.all.to_a
Grammar.find_each do |grammar|
  example_sentences.sample(3).each do |sentence|
    ExampleSentenceGrammar.find_or_create_by!(grammar: grammar, example_sentence: sentence)
  end
end