# == Schema Information
#
# Table name: user_course_level_kanjis
#
#  id                                                                                                                  :bigint           not null, primary key
#  status(Status of the user course level kanji (e.g. not_started, partially_in_progress, all_in_progress, completed)) :integer          default("not_started"), not null
#  user_course_level_kanji_links_count(Number of user reviews for the user course level kanji)                         :integer          default(0), not null
#  created_at                                                                                                          :datetime         not null
#  updated_at                                                                                                          :datetime         not null
#  course_level_kanji_id(CourseLevelKanji that the kanji belongs to)                                                   :bigint           not null
#  user_course_id(UserCourse that the kanji belongs to)                                                                :bigint           not null
#
# Indexes
#
#  index_user_course_level_kanjis_on_course_level_kanji_id  (course_level_kanji_id)
#  index_user_course_level_kanjis_on_user_course_id         (user_course_id)
#  index_user_course_level_kanjis_unique                    (user_course_id,course_level_kanji_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (course_level_kanji_id => course_level_kanjis.id)
#  fk_rails_...  (user_course_id => user_courses.id)
#
class UserCourseLevelKanji < ApplicationRecord
  belongs_to :user_course
  belongs_to :course_level_kanji

  has_many :user_course_level_kanji_links, dependent: :destroy
  has_many :user_review_kanjis, through: :user_course_level_kanji_links

  enum :status, {
    not_ready: 0,
    ready: 1,
    partially_in_progress: 2,
    all_in_progress: 3,
    completed: 4
  }, prefix: true

  validates :user_course_level_kanji_links_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  delegate :course, to: :user_course

  # Update the status based on the `user_course_level_kanji_links_count`
  # @return [void]
  def update_status!
    if user_course_level_kanji_links_count == course_level_kanji.kanjis_count
      if user_course_level_kanji_links.pluck(:status).all?(:completed)
        update!(status: :completed)
      else
        update!(status: :all_in_progress)
      end
    elsif user_course_level_kanji_links_count > 0
      update!(status: :partially_in_progress)
    else
      update!(status: :not_started)
    end
  end
end
