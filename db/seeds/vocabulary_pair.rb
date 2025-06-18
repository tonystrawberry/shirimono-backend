# db/seeds/vocabulary_pair.rb
vocab_ids = Vocabulary.pluck(:id)
vocab_id_pairs = vocab_ids.combination(2).to_a.sample(100)
vocab_id_pairs.each_with_index do |(vocab_id_1, vocab_id_2), index|
  VocabularyPair.find_or_create_by!(
    vocabulary_1_id: vocab_id_1,
    vocabulary_2_id: vocab_id_2,
  ) do |pair|
    pair.pair_type = index.even? ? :synonym : :antonym
  end
end