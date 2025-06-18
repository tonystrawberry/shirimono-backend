# == Schema Information
#
# Table name: course_level_kanjis
#
#  id                                            :bigint           not null, primary key
#  description(Description of the kanji level)   :text
#  kanjis_count(Number of kanjis in the level)   :integer          default(0), not null
#  position(Position of the level in the course) :integer          not null
#  title(Title of the kanji level)               :string
#  created_at                                    :datetime         not null
#  updated_at                                    :datetime         not null
#  course_id(Course the level belongs to)        :bigint           not null
#
# Indexes
#
#  index_course_level_kanjis_on_course_id               (course_id)
#  index_course_level_kanjis_on_course_id_and_position  (course_id,position) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
class CourseLevelKanji < ApplicationRecord
  translates :title, :description

  belongs_to :course

  has_many :course_level_kanji_links, dependent: :destroy
  has_many :kanjis, through: :course_level_kanji_links
  has_many :kanji_exercises, through: :kanjis
  has_many :user_course_level_kanjis, dependent: :destroy
  has_many :user_courses, through: :user_course_level_kanji_links

  validates :title, presence: true
  validates :kanjis_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :position, presence: true, uniqueness: { scope: [:course_id] }
end
