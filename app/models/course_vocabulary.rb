# == Schema Information
#
# Table name: course_vocabularies
#
#  id                                                       :bigint           not null, primary key
#  is_published(Whether the vocabulary is published or not) :boolean          default(FALSE), not null
#  created_at                                               :datetime         not null
#  updated_at                                               :datetime         not null
#  course_id(Course that the vocabulary belongs to)         :bigint           not null
#  vocabulary_id(Vocabulary that belongs to the course)     :bigint           not null
#
# Indexes
#
#  index_course_vocabularies_on_course_id      (course_id)
#  index_course_vocabularies_on_vocabulary_id  (vocabulary_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (vocabulary_id => vocabularies.id)
#
class CourseVocabulary < ApplicationRecord
  belongs_to :course
  belongs_to :vocabulary
end
