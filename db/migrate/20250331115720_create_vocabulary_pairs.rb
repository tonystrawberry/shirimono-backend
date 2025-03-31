class CreateVocabularyPairs < ActiveRecord::Migration[8.0]
  def change
    create_table :vocabulary_pairs do |t|
      t.references :vocabulary_1, null: false, index: true, foreign_key: { to_table: :vocabularies }, comment: "First vocabulary of the pair"
      t.references :vocabulary_2, null: false, index: true, foreign_key: { to_table: :vocabularies }, comment: "Second vocabulary of the pair"
      t.integer :type, null: false, default: 0, comment: "Type of the vocabulary pair (e.g, 0: synonym, 1: antonym)"

      t.timestamps
    end
  end
end
