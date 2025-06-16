class CreateGrammars < ActiveRecord::Migration[8.0]
  def change
    create_table :grammars do |t|
      t.string :title, comment: "Title of the grammar (e.g, 'ために')"
      t.string :slug, comment: "Slug of the grammar (e.g, 'ために-tameni')"

      t.timestamps
    end

    add_index :grammars, :title, unique: true
    add_index :grammars, :slug, unique: true

    reversible do |dir|
      dir.up do
        Grammar.create_translation_table! :meanings => { type: :string, array: true, default: [], null: false, comment: "Meanings of the grammar" }
      end

      dir.down do
        Grammar.drop_translation_table!
      end
    end
  end
end
