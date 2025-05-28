class AddCountersToCourses < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :kanjis_count, :integer, null: false, default: 0, comment: "Number of kanjis in the course"
    add_column :courses, :grammars_count, :integer, null: false, default: 0, comment: "Number of grammars in the course"
    add_column :courses, :vocabularies_count, :integer, null: false, default: 0, comment: "Number of vocabularies in the course"
  end
end
