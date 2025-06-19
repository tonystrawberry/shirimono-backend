# == Schema Information
#
# Table name: user_course_level_kanji_links
#
#  id                                                                                                                  :bigint           not null, primary key
#  status(Status of the user course level kanji (e.g. not_started, partially_in_progress, all_in_progress, completed)) :integer          default("not_started"), not null
#  user_review_kanjis_count(Number of user reviews for the user course level kanji)                                    :integer          default(0), not null
#  created_at                                                                                                          :datetime         not null
#  updated_at                                                                                                          :datetime         not null
#  course_level_kanji_link_id(CourseLevelKanji that the kanji belongs to)                                              :bigint           not null
#  user_course_level_kanji_id(UserCourseLevelKanji that the kanji belongs to)                                          :bigint           not null
#
# Indexes
#
#  idx_on_course_level_kanji_link_id_eec815e419  (course_level_kanji_link_id)
#  idx_on_user_course_level_kanji_id_53e28fc233  (user_course_level_kanji_id)
#  index_user_course_level_kanji_links_unique    (user_course_level_kanji_id,course_level_kanji_link_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (course_level_kanji_link_id => course_level_kanji_links.id)
#  fk_rails_...  (user_course_level_kanji_id => user_course_level_kanjis.id)
#
class UserCourseLevelKanjiLink < ApplicationRecord
  belongs_to :course_level_kanji_link
  belongs_to :user_course_level_kanji

  has_many :user_review_kanjis, dependent: :destroy

  enum :status, {
    not_started: 0,
    partially_in_progress: 1,
    all_in_progress: 2,
    completed: 3
  }, prefix: true

  counter_culture :user_course_level_kanji
end
