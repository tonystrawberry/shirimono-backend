# == Schema Information
#
# Table name: kanji_exercises
#
#  id                                                                                                                                  :bigint           not null, primary key
#  accepted_answers(The accepted answers of the kanji exercise)                                                                        :string           default([]), not null, is an Array
#  exercise_type(The type of the kanji exercise (e.g, `reading`, `meaning`))                                                           :integer          default("reading"), not null
#  question(The question of the kanji exercise)                                                                                        :string           not null
#  question_types(The types of the question of the kanji exercise (e.g, `text`, `multi`))                                              :integer          default([]), not null, is an Array
#  unlock_mastery_level(The mastery level of the kanji exercise (e.g, `beginner`, `elementary`, `intermediate`, `advanced`, `master`)) :integer          default("beginner"), not null
#  wrong_answers(The wrong answers of the kanji exercise)                                                                              :string           default([]), not null, is an Array
#  created_at                                                                                                                          :datetime         not null
#  updated_at                                                                                                                          :datetime         not null
#  kanji_id(The kanji that the exercise belongs to)                                                                                    :bigint           not null
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
