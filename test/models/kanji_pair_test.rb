# == Schema Information
#
# Table name: kanji_pairs
#
#  id                                                                   :bigint           not null, primary key
#  pair_type(Pair type of the kanji pair (e.g, 0: similar, 1: related)) :integer          default("similar"), not null
#  created_at                                                           :datetime         not null
#  updated_at                                                           :datetime         not null
#  kanji_1_id(First kanji of the pair)                                  :bigint           not null
#  kanji_2_id(Second kanji of the pair)                                 :bigint           not null
#
# Indexes
#
#  index_kanji_pairs_on_kanji_1_id  (kanji_1_id)
#  index_kanji_pairs_on_kanji_2_id  (kanji_2_id)
#
# Foreign Keys
#
#  fk_rails_...  (kanji_1_id => kanjis.id)
#  fk_rails_...  (kanji_2_id => kanjis.id)
#
require "test_helper"

class KanjiPairTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
