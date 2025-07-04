# == Schema Information
#
# Table name: user_courses
#
#  id                                                                :bigint           not null, primary key
#  user_review_grammars_count(Number of grammar user reviews)        :integer          default(0), not null
#  user_review_kanjis_count(Number of kanji user reviews)            :integer          default(0), not null
#  user_review_vocabularies_count(Number of vocabulary user reviews) :integer          default(0), not null
#  created_at                                                        :datetime         not null
#  updated_at                                                        :datetime         not null
#  course_id(Course that the user belongs to)                        :bigint           not null
#  user_id(User that the course belongs to)                          :bigint           not null
#
# Indexes
#
#  index_user_courses_on_course_id  (course_id)
#  index_user_courses_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class UserCourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
