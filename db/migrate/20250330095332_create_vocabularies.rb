class CreateVocabularies < ActiveRecord::Migration[8.0]
  def change
    create_table :vocabularies do |t|
      t.string :title, comment: "Title of the vocabulary (e.g, '愛')"
      t.string :slug, comment: "Slug of the vocabulary (e.g, '愛-ai')"
      t.string :kana, comment: "Kana of the vocabulary (e.g, 'あい')"
      t.string :types, array: true, default: [], comment: "Types of the vocabulary (e.g, ['t_noun'])"

      t.timestamps
    end

    add_index :vocabularies, :title, unique: true
    add_index :vocabularies, :slug, unique: true
  end
end
