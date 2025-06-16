# == Schema Information
#
# Table name: kanjis
#
#  id                                                              :bigint           not null, primary key
#  kunyomi_readings(Kunyomi readings of the kanji (e.g, ['あい'])) :string           default([]), is an Array
#  meanings(Meanings of the kanji)                                 :string           default(NULL), not null, is an Array
#  onyomi_readings(Onyomi readings of the kanji (e.g, ['あい']))   :string           default([]), is an Array
#  slug(Slug of the kanji (e.g, '愛-ai'))                          :string
#  title(Title of the kanji (e.g, '愛'))                           :string
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#
# Indexes
#
#  index_kanjis_on_slug   (slug) UNIQUE
#  index_kanjis_on_title  (title) UNIQUE
#
class Kanji < ApplicationRecord
  translates :meanings

  has_many :course_level_kanjis, dependent: :destroy
  has_many :course_levels, through: :course_level_kanjis
  has_many :courses, through: :course_levels
  has_many :example_sentence_kanjis, dependent: :destroy
  has_many :example_sentences, through: :example_sentence_kanjis
  has_many :point_of_the_days, as: :point, dependent: :destroy
  has_many :kanji_pairs_as_kanji_1, class_name: 'KanjiPair', foreign_key: :kanji_1_id, dependent: :destroy
  has_many :kanji_pairs_as_kanji_2, class_name: 'KanjiPair', foreign_key: :kanji_2_id, dependent: :destroy
  has_many :related_kanjis_as_kanji_1, through: :kanji_pairs_as_kanji_1, source: :kanji_2
  has_many :related_kanjis_as_kanji_2, through: :kanji_pairs_as_kanji_2, source: :kanji_1
  has_many :kanji_exercises, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :meanings, presence: true

  after_commit :update_course_kanjis_count, on: [:create, :destroy]

  # Returns the related kanjis of the kanji.
  # @return [ActiveRecord::Relation<Kanji>] The related kanjis.
  def related_kanjis
    Kanji.where(id: related_kanjis_as_kanji_1.pluck(:id) + related_kanjis_as_kanji_2.pluck(:id))
  end

  private

  # Called on :after_commit.
  # Update the kanjis_count of the courses that the kanji belongs to.
  def update_course_kanjis_count
    courses.each(&:refresh_counts)
  end
end
