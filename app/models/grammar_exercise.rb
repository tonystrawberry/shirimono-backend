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
class GrammarExercise < ApplicationRecord
  extend ArrayEnum

  belongs_to :grammar

  enum :exercise_type, {
    usage: 0,
    meaning: 1
  }, prefix: true

  enum :unlock_mastery_level, {
    beginner: 0,
    elementary: 1,
    intermediate: 2,
    advanced: 3,
    master: 4
  }, prefix: true

  array_enum question_types: { text: 0, multi: 1 }, prefix: true

  validates :question, presence: true
  validates :exercise_type, presence: true, inclusion: { in: exercise_types.keys }
  validates :question_types, presence: true
  validates :accepted_answers, presence: true
  validates :unlock_mastery_level, presence: true, inclusion: { in: unlock_mastery_levels.keys }

  validate :ensure_answers_are_not_empty

  private

  # Called on :validate.
  # Ensure that the accepted_answers array is not empty.
  def ensure_answers_are_not_empty
    if accepted_answers.blank? || accepted_answers.reject(&:blank?).empty?
      errors.add(:accepted_answers, "must have at least one non-empty answer")
    end
  end
end
