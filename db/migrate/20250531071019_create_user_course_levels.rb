class CreateUserCourseLevels < ActiveRecord::Migration[7.1]
  def change
    create_table :user_course_levels do |t|
      t.references :user_course, null: false, foreign_key: true
      t.references :course_level, null: false, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :user_course_levels, [:user_course_id, :course_level_id], unique: true
  end
end
