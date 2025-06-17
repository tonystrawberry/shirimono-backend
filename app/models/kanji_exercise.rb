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
class KanjiExercise < ApplicationRecord
  extend ::ArrayEnum

  belongs_to :kanji

  enum :exercise_type, {
    reading: 0,
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
  validates :wrong_answers, presence: true
  validates :unlock_mastery_level, presence: true, inclusion: { in: unlock_mastery_levels.keys }

  validate :ensure_answers_are_not_empty

  private

  # Called on :validate.
  # Ensure that the accepted_answers and wrong_answers arrays are not empty.
  def ensure_answers_are_not_empty
    if accepted_answers.blank? || accepted_answers.reject(&:blank?).empty?
      errors.add(:accepted_answers, "must have at least one non-empty answer")
    end

    if wrong_answers.blank? || wrong_answers.reject(&:blank?).empty?
      errors.add(:wrong_answers, "must have at least one non-empty answer")
    end
  end
end
