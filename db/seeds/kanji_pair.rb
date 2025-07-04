# db/seeds/kanji_pair.rb
kanji_ids = Kanji.pluck(:id)
kanji_ids_pairs = kanji_ids.combination(2).to_a.sample(100)
kanji_ids_pairs.each_with_index do |(kanji_id_1, kanji_id_2), index|
  KanjiPair.find_or_create_by!(
    kanji_1_id: kanji_id_1,
    kanji_2_id: kanji_id_2
  ) do |pair|
    pair.pair_type = index.even? ? :similar : :related
  end
end