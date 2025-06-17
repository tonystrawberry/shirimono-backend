# == Schema Information
#
# Table name: courses
#
#  id                                                       :bigint           not null, primary key
#  grammars_count(Number of grammars in the course)         :integer          default(0), not null
#  kanjis_count(Number of kanjis in the course)             :integer          default(0), not null
#  slug(Slug of the course (e.g, 'n5'))                     :string           not null
#  title(Title of the course (e.g. 'JLPT N5'))              :string           not null
#  vocabularies_count(Number of vocabularies in the course) :integer          default(0), not null
#  created_at                                               :datetime         not null
#  updated_at                                               :datetime         not null
#
require "test_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
