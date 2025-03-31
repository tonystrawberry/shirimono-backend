class CreateCourseGrammars < ActiveRecord::Migration[8.0]
  def change
    create_table :course_grammars do |t|
      t.references :course, null: false, foreign_key: true, comment: "Course that the grammar belongs to"
      t.references :grammar, null: false, foreign_key: true, comment: "Grammar that belongs to the course"
      t.boolean :is_published, null: false, default: false, comment: "Whether the grammar is published or not"

      t.timestamps
    end
  end
end
