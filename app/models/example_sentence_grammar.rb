# == Schema Information
#
# Table name: example_sentence_grammars
#
#  id                                                              :bigint           not null, primary key
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#  example_sentence_id(Example sentence that contains the grammar) :bigint           not null
#  grammar_id(Grammar that appears in the example sentence)        :bigint           not null
#
# Indexes
#
#  index_example_sentence_grammars_on_example_sentence_id  (example_sentence_id)
#  index_example_sentence_grammars_on_grammar_id           (grammar_id)
#  index_example_sentence_grammars_unique                  (example_sentence_id,grammar_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (example_sentence_id => example_sentences.id)
#  fk_rails_...  (grammar_id => grammars.id)
#
class ExampleSentenceGrammar < ApplicationRecord
  belongs_to :example_sentence
  belongs_to :grammar

  validates :example_sentence_id, uniqueness: { scope: :grammar_id }, presence: true
  validates :grammar_id, presence: true
end
