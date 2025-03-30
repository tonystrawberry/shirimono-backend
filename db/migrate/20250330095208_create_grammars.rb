class CreateGrammars < ActiveRecord::Migration[8.0]
  def change
    create_table :grammars do |t|
      t.string :title, comment: "Title of the grammar (e.g, 'ために')"
      t.string :slug, comment: "Slug of the grammar (e.g, 'ために-tameni')"

      t.timestamps
    end

    add_index :grammars, :title, unique: true
    add_index :grammars, :slug, unique: true
  end
end
