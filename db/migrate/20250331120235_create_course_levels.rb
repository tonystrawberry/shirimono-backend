class CreateCourseLevels < ActiveRecord::Migration[8.0]
  def change
    create_table :course_levels do |t|
      t.references :course, null: false, foreign_key: true, comment: "Course the level belongs to"

      t.integer :level, null: false, comment: "Level of the course"
      t.integer :point_type, null: false, default: 0, comment: "Type of the course point (e.g, 0: kanji, 1: vocabulary, 2: grammar)"

      t.timestamps
    end

    add_index :course_levels, %i[course_id level point_type], unique: true
  end
end
