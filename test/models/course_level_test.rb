# == Schema Information
#
# Table name: course_levels
#
#  id                                                                              :bigint           not null, primary key
#  level(Level of the course)                                                      :integer          not null
#  point_type(Type of the course point (e.g, 0: kanji, 1: vocabulary, 2: grammar)) :integer          default(0), not null
#  created_at                                                                      :datetime         not null
#  updated_at                                                                      :datetime         not null
#  course_id(Course the level belongs to)                                          :bigint           not null
#
# Indexes
#
#  index_course_levels_on_course_id                           (course_id)
#  index_course_levels_on_course_id_and_level_and_point_type  (course_id,level,point_type) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
require "test_helper"

class CourseLevelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
