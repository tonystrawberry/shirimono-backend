# == Schema Information
#
# Table name: vocabulary_pairs
#
#  id                                                              :bigint           not null, primary key
#  type(Type of the vocabulary pair (e.g, 0: synonym, 1: antonym)) :integer          default(0), not null
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#  vocabulary_1_id(First vocabulary of the pair)                   :bigint           not null
#  vocabulary_2_id(Second vocabulary of the pair)                  :bigint           not null
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
end
