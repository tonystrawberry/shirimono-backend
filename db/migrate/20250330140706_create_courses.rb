class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :slug, comment: "Slug of the course (e.g, 'n5')"

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Course.create_translation_table! :title => { type: :string, comment: "Title of the course (e.g. 'JLPT N5')" }
      end

      dir.down do
        Course.drop_translation_table!
      end
    end
  end
end
