# == Schema Information
#
# Table name: example_sentences
#
#  id                                                       :bigint           not null, primary key
#  sentence(The Japanese sentence)                          :string           not null
#  sentence_html(The Japanese sentence with HTML ruby tags) :string           not null
#  translation                                              :string           not null
#  created_at                                               :datetime         not null
#  updated_at                                               :datetime         not null
#
# Indexes
#
#  index_example_sentences_on_sentence  (sentence) UNIQUE
#
class ExampleSentence < ApplicationRecord
  translates :translation

  has_many :example_sentence_kanjis, dependent: :destroy
  has_many :kanjis, through: :example_sentence_kanjis
  has_many :example_sentence_vocabularies, dependent: :destroy
  has_many :vocabularies, through: :example_sentence_vocabularies
  has_many :example_sentence_grammars, dependent: :destroy
  has_many :grammars, through: :example_sentence_grammars

  validates :sentence, presence: true, uniqueness: true
  validates :sentence_html, presence: true
  validates :translation, presence: true
end
