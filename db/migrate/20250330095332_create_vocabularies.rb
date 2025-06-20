class CreateVocabularies < ActiveRecord::Migration[8.0]
  def change
    create_table :vocabularies do |t|
      t.string :title, comment: "Title of the vocabulary (e.g, '愛')"
      t.string :slug, comment: "Slug of the vocabulary (e.g, '愛-ai')"
      t.string :kana, comment: "Kana of the vocabulary (e.g, 'あい')"
      t.string :types, array: true, default: [], comment: "Types of the vocabulary (e.g, ['t_noun'])"

      t.timestamps
    end

    add_index :vocabularies, :slug, unique: true

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
