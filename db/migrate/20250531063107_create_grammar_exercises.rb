class CreateGrammarExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :grammar_exercises do |t|
      t.references :grammar, null: false, foreign_key: true
      t.string :question, null: false, comment: 'The question of the grammar exercise (e.g. `食べ{placeholder})'
      t.integer :exercise_type, null: false, default: 0, comment: 'The type of the grammar exercise (e.g, `grammar`, `vocabulary`, `kanji`)'
      t.integer :question_types, array: true, default: [], null: false, comment: 'The types of the question of the grammar exercise (e.g, `text`, `multi`)'
      t.string :accepted_answers, array: true, default: [], null: false, comment: 'The accepted answers of the grammar exercise'
      t.string :wrong_answers, array: true, default: [], null: false, comment: 'The wrong answers of the grammar exercise'
      t.integer :unlock_mastery_level, null: false, default: 0, comment: 'The mastery level of the grammar exercise (e.g, `beginner`, `elementary`, `intermediate`, `advanced`, `master`)'

      t.timestamps
    end

    # Add translation table for grammar exercises
    reversible do |dir|
      dir.up do
        GrammarExercise.create_translation_table!(
          :question_translation => { type: :string, null: false, comment: 'The question translation of the grammar exercise (e.g. `I am eating.`)' },
        )
      end

      dir.down do
        GrammarExercise.drop_translation_table!
      end
    end
  end
end
