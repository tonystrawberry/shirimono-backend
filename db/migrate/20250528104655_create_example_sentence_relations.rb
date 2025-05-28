class CreateExampleSentenceRelations < ActiveRecord::Migration[8.0]
  def change
    create_table :example_sentence_kanjis do |t|
      t.references :example_sentence, null: false, foreign_key: true, comment: 'Example sentence that contains the kanji'
      t.references :kanji, null: false, foreign_key: true, comment: 'Kanji that appears in the example sentence'

      t.timestamps
    end

    create_table :example_sentence_vocabularies do |t|
      t.references :example_sentence, null: false, foreign_key: true, comment: 'Example sentence that contains the vocabulary'
      t.references :vocabulary, null: false, foreign_key: true, comment: 'Vocabulary that appears in the example sentence'

      t.timestamps
    end

    create_table :example_sentence_grammars do |t|
      t.references :example_sentence, null: false, foreign_key: true, comment: 'Example sentence that contains the grammar'
      t.references :grammar, null: false, foreign_key: true, comment: 'Grammar that appears in the example sentence'

      t.timestamps
    end

    add_index :example_sentence_kanjis, [:example_sentence_id, :kanji_id], unique: true, name: 'index_example_sentence_kanjis_unique'
    add_index :example_sentence_vocabularies, [:example_sentence_id, :vocabulary_id], unique: true, name: 'index_example_sentence_vocabularies_unique'
    add_index :example_sentence_grammars, [:example_sentence_id, :grammar_id], unique: true, name: 'index_example_sentence_grammars_unique'
  end
end