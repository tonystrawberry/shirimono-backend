class CreatePointOfTheDays < ActiveRecord::Migration[8.0]
  def change
    create_table :point_of_the_days do |t|
      t.references :point, polymorphic: true, null: false, index: true, comment: 'The point that is featured'
      t.date :featured_on, null: false, comment: 'The date when the point is featured'

      t.timestamps
    end

    add_index :point_of_the_days, :featured_on, unique: true
  end
end