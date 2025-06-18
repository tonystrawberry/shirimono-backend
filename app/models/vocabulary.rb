# == Schema Information
#
# Table name: vocabularies
#
#  id                                               :bigint           not null, primary key
#  kana(Kana of the vocabulary (e.g, 'あい'))       :string
#  meanings(Meanings of the vocabulary)             :string           default(NULL), not null, is an Array
#  slug(Slug of the vocabulary (e.g, '愛-ai'))      :string
#  title(Title of the vocabulary (e.g, '愛'))       :string
#  types(Types of the vocabulary (e.g, ['t_noun'])) :string           default([]), is an Array
#  created_at                                       :datetime         not null
#  updated_at                                       :datetime         not null
#
# Indexes
#
#  index_vocabularies_on_slug  (slug) UNIQUE
#
class Vocabulary < ApplicationRecord
  translates :meanings

  has_many :course_level_vocabulary_links, dependent: :destroy
  has_many :course_level_vocabularies, through: :course_level_vocabulary_links
  has_many :courses, through: :course_level_vocabularies

  has_many :example_sentence_vocabularies, dependent: :destroy
  has_many :example_sentences, through: :example_sentence_vocabularies
  has_many :point_of_the_days, as: :point, dependent: :destroy
  has_many :vocabulary_exercises, dependent: :destroy

  # Vocabulary pairs
  has_many :vocabulary_pairs_as_vocabulary_1, class_name: 'VocabularyPair', foreign_key: :vocabulary_1_id, dependent: :destroy
  has_many :vocabulary_pairs_as_vocabulary_2, class_name: 'VocabularyPair', foreign_key: :vocabulary_2_id, dependent: :destroy
  has_many :synonym_pairs_as_vocabulary_1, -> { where(pair_type: :synonym) }, class_name: 'VocabularyPair', foreign_key: :vocabulary_1_id
  has_many :synonym_pairs_as_vocabulary_2, -> { where(pair_type: :synonym) }, class_name: 'VocabularyPair', foreign_key: :vocabulary_2_id
  has_many :antonym_pairs_as_vocabulary_1, -> { where(pair_type: :antonym) }, class_name: 'VocabularyPair', foreign_key: :vocabulary_1_id
  has_many :antonym_pairs_as_vocabulary_2, -> { where(pair_type: :antonym) }, class_name: 'VocabularyPair', foreign_key: :vocabulary_2_id

  has_many :synonyms_as_vocabulary_1, through: :synonym_pairs_as_vocabulary_1, source: :vocabulary_2
  has_many :synonyms_as_vocabulary_2, through: :synonym_pairs_as_vocabulary_2, source: :vocabulary_1
  has_many :antonyms_as_vocabulary_1, through: :antonym_pairs_as_vocabulary_1, source: :vocabulary_2
  has_many :antonyms_as_vocabulary_2, through: :antonym_pairs_as_vocabulary_2, source: :vocabulary_1

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :kana, presence: true
  validates :meanings, presence: true
  validates :types, presence: true

  after_commit :update_course_vocabularies_count, on: [:create, :destroy]

  def synonyms
    Vocabulary.where(id: synonyms_as_vocabulary_1.pluck(:id) + synonyms_as_vocabulary_2.pluck(:id))
  end

  def antonyms
    Vocabulary.where(id: antonyms_as_vocabulary_1.pluck(:id) + antonyms_as_vocabulary_2.pluck(:id))
  end

  private

  # Called on :after_commit.
  # Update the `vocabularies_count` of the courses that the vocabulary belongs to.
  def update_course_vocabularies_count
    courses.each(&:refresh_counts)
  end
end
