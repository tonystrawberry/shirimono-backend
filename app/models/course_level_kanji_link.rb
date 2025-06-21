# == Schema Information
#
# Table name: course_level_kanji_links
#
#  id                                                            :bigint           not null, primary key
#  is_published(Whether the kanji is published or not)           :boolean          default(FALSE), not null
#  created_at                                                    :datetime         not null
#  updated_at                                                    :datetime         not null
#  course_level_kanji_id(Course level that the kanji belongs to) :bigint           not null
#  kanji_id(Kanji that belongs to the course)                    :bigint           not null
#
# Indexes
#
#  idx_on_course_level_kanji_id_kanji_id_34f0f92c81         (course_level_kanji_id,kanji_id) UNIQUE
#  index_course_level_kanji_links_on_course_level_kanji_id  (course_level_kanji_id)
#  index_course_level_kanji_links_on_kanji_id               (kanji_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_level_kanji_id => course_level_kanjis.id)
#  fk_rails_...  (kanji_id => kanjis.id)
#
class CourseLevelKanjiLink < ApplicationRecord
  belongs_to :course_level_kanji
  belongs_to :kanji

  has_many :user_course_level_kanji_links, dependent: :destroy

  validates :course_level_kanji_id, uniqueness: { scope: :kanji_id }
  validates :is_published, inclusion: { in: [true, false] }

  counter_culture :course_level_kanji

  delegate :course, to: :course_level_kanji
end
