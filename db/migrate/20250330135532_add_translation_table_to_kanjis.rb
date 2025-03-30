class AddTranslationTableToKanjis < ActiveRecord::Migration[8.0]
  def change
    reversible do |dir|
      dir.up do
        Kanji.create_translation_table! :meanings => { type: :string, array: true, default: [], null: false, comment: "Meanings of the kanji" }
      end

      dir.down do
        Kanji.drop_translation_table!
      end
    end
  end
end
