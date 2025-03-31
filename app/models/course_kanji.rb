# == Schema Information
#
# Table name: course_kanjis
#
#  id                                                  :bigint           not null, primary key
#  is_published(Whether the kanji is published or not) :boolean          default(FALSE), not null
#  created_at                                          :datetime         not null
#  updated_at                                          :datetime         not null
#  course_id(Course that the kanji belongs to)         :bigint           not null
#  kanji_id(Kanji that belongs to the course)          :bigint           not null
#
# Indexes
#
#  index_course_kanjis_on_course_id  (course_id)
#  index_course_kanjis_on_kanji_id   (kanji_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (kanji_id => kanjis.id)
#
class CourseKanji < ApplicationRecord
  belongs_to :course
  belongs_to :kanji
end
