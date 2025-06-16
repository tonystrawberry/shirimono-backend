# == Schema Information
#
# Table name: course_level_kanjis
#
#  id                                                      :bigint           not null, primary key
#  is_published(Whether the kanji is published or not)     :boolean          default(FALSE), not null
#  created_at                                              :datetime         not null
#  updated_at                                              :datetime         not null
#  course_level_id(Course level that the kanji belongs to) :bigint           not null
#  kanji_id(Kanji that belongs to the course)              :bigint           not null
#
# Indexes
#
#  index_course_level_kanjis_on_course_level_id               (course_level_id)
#  index_course_level_kanjis_on_course_level_id_and_kanji_id  (course_level_id,kanji_id) UNIQUE
#  index_course_level_kanjis_on_kanji_id                      (kanji_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_level_id => course_levels.id)
#  fk_rails_...  (kanji_id => kanjis.id)
#
class CourseLevelKanji < ApplicationRecord
  belongs_to :course_level
  belongs_to :kanji

  validates :course_level_id, uniqueness: { scope: :kanji_id }
  validates :is_published, inclusion: { in: [true, false] }
end
