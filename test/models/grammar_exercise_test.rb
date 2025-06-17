# == Schema Information
#
# Table name: grammar_exercises
#
#  id                                                                                                                                    :bigint           not null, primary key
#  accepted_answers(The accepted answers of the grammar exercise)                                                                        :string           default([]), not null, is an Array
#  exercise_type(The type of the grammar exercise (e.g, `grammar`, `vocabulary`, `kanji`))                                               :integer          default("usage"), not null
#  question(The question of the grammar exercise)                                                                                        :string           not null
#  question_types(The types of the question of the grammar exercise (e.g, `text`, `multi`))                                              :integer          default([]), not null, is an Array
#  unlock_mastery_level(The mastery level of the grammar exercise (e.g, `beginner`, `elementary`, `intermediate`, `advanced`, `master`)) :integer          default("beginner"), not null
#  wrong_answers(The wrong answers of the grammar exercise)                                                                              :string           default([]), not null, is an Array
#  created_at                                                                                                                            :datetime         not null
#  updated_at                                                                                                                            :datetime         not null
#  grammar_id                                                                                                                            :bigint           not null
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
