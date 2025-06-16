class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :slug, null: false, comment: "Slug of the course (e.g, 'n5')"
      t.integer :kanjis_count, null: false, default: 0, comment: "Number of kanjis in the course"
      t.integer :grammars_count, null: false, default: 0, comment: "Number of grammars in the course"
      t.integer :vocabularies_count, null: false, default: 0, comment: "Number of vocabularies in the course"

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Course.create_translation_table!(
          :title => { type: :string, comment: "Title of the course (e.g. 'JLPT N5')", null: false }
        )
      end

      dir.down do
        Course.drop_translation_table!
      end
    end
  end
end
