# == Schema Information
#
# Table name: example_sentence_vocabularies
#
#  id                                                                 :bigint           not null, primary key
#  created_at                                                         :datetime         not null
#  updated_at                                                         :datetime         not null
#  example_sentence_id(Example sentence that contains the vocabulary) :bigint           not null
#  vocabulary_id(Vocabulary that appears in the example sentence)     :bigint           not null
#
# Indexes
#
#  index_example_sentence_vocabularies_on_example_sentence_id  (example_sentence_id)
#  index_example_sentence_vocabularies_on_vocabulary_id        (vocabulary_id)
#  index_example_sentence_vocabularies_unique                  (example_sentence_id,vocabulary_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (example_sentence_id => example_sentences.id)
#  fk_rails_...  (vocabulary_id => vocabularies.id)
#
class ExampleSentenceVocabulary < ApplicationRecord
  belongs_to :example_sentence
  belongs_to :vocabulary

  validates :example_sentence_id, uniqueness: { scope: :vocabulary_id }, presence: true
  validates :vocabulary_id, presence: true
end
