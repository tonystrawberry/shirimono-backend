# == Schema Information
#
# Table name: grammar_exercises
#
#  id                   :bigint           not null, primary key
#  accepted_answers     :string           default([]), not null, is an Array
#  exercise_type        :integer          default("usage"), not null
#  question             :string           not null
#  question_types       :integer          default([]), not null, is an Array
#  unlock_mastery_level :integer          default("beginner"), not null
#  wrong_answers        :string           default([]), not null, is an Array
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  grammar_id           :bigint           not null
#
# Indexes
#
#  index_grammar_exercises_on_grammar_id  (grammar_id)
#
# Foreign Keys
#
#  fk_rails_...  (grammar_id => grammars.id)
#
require "test_helper"

class GrammarExerciseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
