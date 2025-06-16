class CreateCourseLevelGrammars < ActiveRecord::Migration[8.0]
  def change
    create_table :course_level_grammars do |t|
      t.references :course_level, null: false, foreign_key: true, comment: "Course level that the grammar belongs to"
      t.references :grammar, null: false, foreign_key: true, comment: "Grammar that belongs to the course"
      t.boolean :is_published, null: false, default: false, comment: "Whether the grammar is published or not"

      t.timestamps
    end

    add_index :course_level_grammars, [:course_level_id, :grammar_id], unique: true
  end
end
