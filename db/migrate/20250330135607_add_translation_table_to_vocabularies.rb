class AddTranslationTableToVocabularies < ActiveRecord::Migration[8.0]
  def change
    reversible do |dir|
      dir.up do
        Vocabulary.create_translation_table! :meanings => { type: :string, array: true, default: [], null: false, comment: "Meanings of the vocabulary" }
      end

      dir.down do
        Vocabulary.drop_translation_table!
      end
    end
  end
end
