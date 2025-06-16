class CreateKanjis < ActiveRecord::Migration[8.0]
  def change
    create_table :kanjis do |t|
      t.string :title, comment: "Title of the kanji (e.g, '愛')"
      t.string :slug, comment: "Slug of the kanji (e.g, '愛-ai')"
      t.string :kunyomi_readings, array: true, default: [], comment: "Kunyomi readings of the kanji (e.g, ['あい'])"
      t.string :onyomi_readings, array: true, default: [], comment: "Onyomi readings of the kanji (e.g, ['あい'])"

      t.timestamps
    end

    add_index :kanjis, :title, unique: true
    add_index :kanjis, :slug, unique: true

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
