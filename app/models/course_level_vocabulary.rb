# == Schema Information
#
# Table name: course_level_vocabularies
#
#  id                                                           :bigint           not null, primary key
#  is_published(Whether the vocabulary is published or not)     :boolean          default(FALSE), not null
#  created_at                                                   :datetime         not null
#  updated_at                                                   :datetime         not null
#  course_level_id(Course level that the vocabulary belongs to) :bigint           not null
#  vocabulary_id(Vocabulary that belongs to the course)         :bigint           not null
#
# Indexes
#
#  idx_on_course_level_id_vocabulary_id_150ec54039     (course_level_id,vocabulary_id) UNIQUE
#  index_course_level_vocabularies_on_course_level_id  (course_level_id)
#  index_course_level_vocabularies_on_vocabulary_id    (vocabulary_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_level_id => course_levels.id)
#  fk_rails_...  (vocabulary_id => vocabularies.id)
#
class CourseLevelVocabulary < ApplicationRecord
  belongs_to :course_level
  belongs_to :vocabulary

  validates :course_level_id, uniqueness: { scope: :vocabulary_id }
  validates :is_published, inclusion: { in: [true, false] }
end
