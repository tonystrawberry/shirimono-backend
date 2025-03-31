class CreateKanjiPairs < ActiveRecord::Migration[8.0]
  def change
    create_table :kanji_pairs do |t|
      t.references :kanji_1, null: false, index: true, foreign_key: { to_table: :kanjis }, comment: "First kanji of the pair"
      t.references :kanji_2, null: false, index: true, foreign_key: { to_table: :kanjis }, comment: "Second kanji of the pair"

      t.timestamps
    end
  end
end
