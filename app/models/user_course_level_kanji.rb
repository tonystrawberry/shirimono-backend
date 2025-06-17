# == Schema Information
#
# Table name: user_course_level_kanjis
#
#  id                                                                                                                  :bigint           not null, primary key
#  status(Status of the user course level kanji (e.g. not_started, partially_in_progress, all_in_progress, completed)) :integer          default("not_started"), not null
#  user_reviews_kanjis_count(Number of user reviews for the user course level kanji)                                   :integer          default(0), not null
#  created_at                                                                                                          :datetime         not null
#  updated_at                                                                                                          :datetime         not null
#  course_level_kanji_id(CourseLevelKanji that the kanji belongs to)                                                   :bigint           not null
#  user_course_id(UserCourse that the kanji belongs to)                                                                :bigint           not null
#
# Indexes
#
#  index_user_course_level_kanjis_on_course_level_kanji_id  (course_level_kanji_id)
#  index_user_course_level_kanjis_on_user_course_id         (user_course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_level_kanji_id => course_level_kanjis.id)
#  fk_rails_...  (user_course_id => user_courses.id)
#
class UserCourseLevelKanji < ApplicationRecord
  belongs_to :user_course
  belongs_to :course_level_kanji

  has_many :user_review_kanjis, dependent: :destroy

  enum :status, {
    not_started: 0,
    partially_in_progress: 1,
    all_in_progress: 2,
    completed: 3
  }, prefix: true

  validates :status, inclusion: { in: statuses.keys }
  validates :user_reviews_kanjis_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
