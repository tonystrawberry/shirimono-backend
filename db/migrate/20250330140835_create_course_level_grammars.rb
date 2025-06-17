class CreateCourseLevelGrammars < ActiveRecord::Migration[8.0]
  def change
    create_table :course_level_grammars do |t|
      t.references :course, null: false, foreign_key: true, comment: "Course the level belongs to"

      t.integer :position, null: false, comment: "Position of the level in the course"
      t.integer :grammars_count, null: false, default: 0, comment: "Number of grammars in the level"

      t.timestamps
    end

    add_index :course_level_grammars, %i[course_id position], unique: true

    reversible do |dir|
      dir.up do
      CourseLevelGrammar.create_translation_table!(
          :title => { type: :string, comment: "Title of the grammar level" },
          :description => { type: :text, comment: "Description of the grammar level" }
        )
      end

      dir.down do
        CourseLevelGrammar.drop_translation_table!
      end
    end
  end
end
