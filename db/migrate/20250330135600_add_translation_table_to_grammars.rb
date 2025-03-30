class AddTranslationTableToGrammars < ActiveRecord::Migration[8.0]
  def change
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
