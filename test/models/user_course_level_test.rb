# == Schema Information
#
# Table name: user_course_levels
#
#  id              :bigint           not null, primary key
#  status          :integer          default("ready"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_level_id :bigint           not null
#  user_course_id  :bigint           not null
#
# Indexes
#
#  index_user_course_levels_on_course_level_id                     (course_level_id)
#  index_user_course_levels_on_user_course_id                      (user_course_id)
#  index_user_course_levels_on_user_course_id_and_course_level_id  (user_course_id,course_level_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (course_level_id => course_levels.id)
#  fk_rails_...  (user_course_id => user_courses.id)
#
require "test_helper"

class UserCourseLevelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
