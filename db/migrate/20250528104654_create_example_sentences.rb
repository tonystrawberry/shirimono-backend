class CreateExampleSentences < ActiveRecord::Migration[8.0]
  def change
    create_table :example_sentences do |t|
      t.string :sentence, null: false, comment: 'The Japanese sentence'
      t.string :sentence_html, null: false, comment: 'The Japanese sentence with HTML ruby tags'

      t.timestamps
    end

    add_index :example_sentences, :sentence, unique: true

    reversible do |dir|
      dir.up do
        ExampleSentence.create_translation_table!(
          translation: { type: :string, null: false }
        )
      end

      dir.down do
        ExampleSentence.drop_translation_table!
      end
    end
  end
end