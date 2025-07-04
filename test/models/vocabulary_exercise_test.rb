# == Schema Information
#
# Table name: vocabulary_exercises
#
#  id                                                                                                                                       :bigint           not null, primary key
#  accepted_answers(The accepted answers of the vocabulary exercise)                                                                        :string           default([]), not null, is an Array
#  exercise_type(The type of the vocabulary exercise (e.g, `reading`, `meaning`))                                                           :integer          default("reading"), not null
#  question(The question of the vocabulary exercise)                                                                                        :string           not null
#  question_types(The types of the question of the vocabulary exercise (e.g, `text`, `multi`))                                              :integer          default([]), not null, is an Array
#  unlock_mastery_level(The mastery level of the vocabulary exercise (e.g, `beginner`, `elementary`, `intermediate`, `advanced`, `master`)) :integer          default("beginner"), not null
#  wrong_answers(The wrong answers of the vocabulary exercise)                                                                              :string           default([]), not null, is an Array
#  created_at                                                                                                                               :datetime         not null
#  updated_at                                                                                                                               :datetime         not null
#  vocabulary_id(The vocabulary that the exercise belongs to)                                                                               :bigint           not null
#
# Indexes
#
#  index_vocabulary_exercises_on_vocabulary_id  (vocabulary_id)
#
# Foreign Keys
#
#  fk_rails_...  (vocabulary_id => vocabularies.id)
#
require "test_helper"

class VocabularyExerciseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
