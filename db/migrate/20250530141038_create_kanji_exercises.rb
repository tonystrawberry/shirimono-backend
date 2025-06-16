class CreateKanjiExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :kanji_exercises do |t|
      t.references :kanji, null: false, foreign_key: true, comment: 'The kanji that the exercise belongs to'
      t.string :question, null: false, comment: 'The question of the kanji exercise'
      t.integer :exercise_type, null: false, default: 0, comment: 'The type of the kanji exercise (e.g, `reading`, `meaning`)'
      t.integer :question_types, array: true, default: [], null: false, comment: 'The types of the question of the kanji exercise (e.g, `text`, `multi`)'
      t.string :accepted_answers, array: true, default: [], null: false, comment: 'The accepted answers of the kanji exercise'
      t.string :wrong_answers, array: true, default: [], null: false, comment: 'The wrong answers of the kanji exercise'
      t.integer :unlock_mastery_level, null: false, default: 0, comment: 'The mastery level of the kanji exercise (e.g, `beginner`, `elementary`, `intermediate`, `advanced`, `master`)'

      t.timestamps
    end
  end
end
