# == Schema Information
#
# Table name: kanji_exercises
#
#  id                   :bigint           not null, primary key
#  accepted_answers     :string           default([]), not null, is an Array
#  exercise_type        :integer          default("reading"), not null
#  question             :string           not null
#  question_types       :integer          default([]), not null, is an Array
#  unlock_mastery_level :integer          default("beginner"), not null
#  wrong_answers        :string           default([]), not null, is an Array
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  kanji_id             :bigint           not null
#
# Indexes
#
#  index_kanji_exercises_on_kanji_id  (kanji_id)
#
# Foreign Keys
#
#  fk_rails_...  (kanji_id => kanjis.id)
#
require "test_helper"

class KanjiExerciseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
