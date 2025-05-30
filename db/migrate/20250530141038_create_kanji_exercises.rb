class CreateKanjiExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :kanji_exercises do |t|
      t.references :kanji, null: false, foreign_key: true
      t.string :question, null: false
      t.integer :exercise_type, null: false, default: 0
      t.integer :question_types, array: true, default: [], null: false
      t.string :accepted_answers, array: true, default: [], null: false
      t.string :wrong_answers, array: true, default: [], null: false
      t.integer :unlock_mastery_level, null: false, default: 0

      t.timestamps
    end
  end
end
