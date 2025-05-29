class ModifyCourseLevels < ActiveRecord::Migration[8.0]
  def up
    # First rename level to position
    rename_column :course_levels, :level, :position

    # Then add course_points_count
    add_column :course_levels, :course_points_count, :integer, null: false, default: 0,
              comment: "Number of course points in the level"

    # Now we can add comments to existing columns
    change_column_comment :course_levels, :point_type, "Type of the course points in the level"
    change_column_comment :course_levels, :position, "Position of the level in the course"

    CourseLevel.create_translation_table!({
      title: { type: :string, null: false, comment: "Title of the level" },
      description: { type: :text, comment: "Description of the level" }
    })

    add_index :course_levels, [:course_id, :point_type, :position], unique: true,
              name: "index_course_levels_on_course_point_type_and_position"
  end

  def down
    remove_column :course_levels, :course_points_count
    CourseLevel.drop_translation_table!
    rename_column :course_levels, :position, :level
  end
end
