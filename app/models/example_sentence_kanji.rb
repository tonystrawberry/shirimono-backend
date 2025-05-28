# == Schema Information
#
# Table name: example_sentence_kanjis
#
#  id                                                            :bigint           not null, primary key
#  created_at                                                    :datetime         not null
#  updated_at                                                    :datetime         not null
#  example_sentence_id(Example sentence that contains the kanji) :bigint           not null
#  kanji_id(Kanji that appears in the example sentence)          :bigint           not null
#
# Indexes
#
#  index_example_sentence_kanjis_on_example_sentence_id  (example_sentence_id)
#  index_example_sentence_kanjis_on_kanji_id             (kanji_id)
#  index_example_sentence_kanjis_unique                  (example_sentence_id,kanji_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (example_sentence_id => example_sentences.id)
#  fk_rails_...  (kanji_id => kanjis.id)
#
class ExampleSentenceKanji < ApplicationRecord
  belongs_to :example_sentence
  belongs_to :kanji

  validates :example_sentence_id, uniqueness: { scope: :kanji_id }
end
