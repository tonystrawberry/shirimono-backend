class CreatePointOfTheDays < ActiveRecord::Migration[8.0]
  def change
    create_table :point_of_the_days do |t|
      t.references :point, polymorphic: true, null: false, index: true
      t.date :featured_on, null: false

      t.timestamps
    end

    add_index :point_of_the_days, :featured_on, unique: true
  end
end