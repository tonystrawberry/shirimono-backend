class CreateUserCourseLevels < ActiveRecord::Migration[7.1]
  def change
    create_table :user_course_levels do |t|
      t.references :user_course, null: false, foreign_key: true, comment: 'The user course that the user course level belongs to'
      t.references :course_level, null: false, foreign_key: true, comment: 'The course level that the user course level belongs to'
      t.integer :status, null: false, default: 0, comment: 'Status of the user course level (e.g, `ready`, `lessons_not_completed`, `lessons_completed`, `lessons_not_completed_and_grammar_not_completed`, `lessons_completed_and_grammar_not_completed`, `lessons_completed_and_grammar_completed`, `lessons_not_completed_and_grammar_completed`)'

      t.timestamps
    end

    add_index :user_course_levels, [:user_course_id, :course_level_id], unique: true
  end
end
