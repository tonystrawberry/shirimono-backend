# == Schema Information
#
# Table name: courses
#
#  id                                          :bigint           not null, primary key
#  slug(Slug of the course (e.g, 'n5'))        :string
#  title(Title of the course (e.g. 'JLPT N5')) :string
#  created_at                                  :datetime         not null
#  updated_at                                  :datetime         not null
#
require "test_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
