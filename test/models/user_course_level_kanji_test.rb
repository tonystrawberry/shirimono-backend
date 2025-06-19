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
require "test_helper"

class UserCourseLevelKanjiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
