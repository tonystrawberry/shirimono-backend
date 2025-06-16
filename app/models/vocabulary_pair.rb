# == Schema Information
#
# Table name: vocabulary_pairs
#
#  id                                                                        :bigint           not null, primary key
#  pair_type(Pair type of the vocabulary pair (e.g, 0: synonym, 1: antonym)) :integer          default("synonym"), not null
#  created_at                                                                :datetime         not null
#  updated_at                                                                :datetime         not null
#  vocabulary_1_id(First vocabulary of the pair)                             :bigint           not null
#  vocabulary_2_id(Second vocabulary of the pair)                            :bigint           not null
#
# Indexes
#
#  index_vocabulary_pairs_on_vocabulary_1_id  (vocabulary_1_id)
#  index_vocabulary_pairs_on_vocabulary_2_id  (vocabulary_2_id)
#
# Foreign Keys
#
#  fk_rails_...  (vocabulary_1_id => vocabularies.id)
#  fk_rails_...  (vocabulary_2_id => vocabularies.id)
#
class VocabularyPair < ApplicationRecord
  belongs_to :vocabulary_1, class_name: 'Vocabulary'
  belongs_to :vocabulary_2, class_name: 'Vocabulary'

  enum :pair_type, {
    synonym: 0,
    antonym: 1
  }, prefix: true

  validates :vocabulary_1_id, uniqueness: { scope: :vocabulary_2_id }
  validates :pair_type, presence: true
  validate :different_vocabularies

  private

  def different_vocabularies
    if vocabulary_1_id == vocabulary_2_id
      errors.add(:base, "Vocabulary pair must consist of different vocabularies")
    end
  end
end
