class CreateCourseLevels < ActiveRecord::Migration[8.0]
  def change
    create_table :course_levels do |t|
      t.references :course, null: false, foreign_key: true, comment: "Course the level belongs to"

      t.integer :position, null: false, comment: "Position of the level in the course"
      t.integer :point_type, null: false, default: 0, comment: "Type of the course points (e.g, 0: kanji, 1: vocabulary, 2: grammar)"
      t.integer :course_points_count, null: false, default: 0, comment: "Number of course points in the level"

      t.timestamps
    end

    add_index :course_levels, %i[course_id position point_type], unique: true

    reversible do |dir|
      dir.up do
        CourseLevel.create_translation_table!(
          :title => { type: :string, comment: "Title of the level" },
          :description => { type: :text, comment: "Description of the level" }
        )
      end

      dir.down do
        CourseLevel.drop_translation_table!
      end
    end
  end
end
