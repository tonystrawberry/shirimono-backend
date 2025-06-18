# == Schema Information
#
# Table name: course_level_vocabulary_links
#
#  id                                                                      :bigint           not null, primary key
#  is_published(Whether the vocabulary is published or not)                :boolean          default(FALSE), not null
#  created_at                                                              :datetime         not null
#  updated_at                                                              :datetime         not null
#  course_level_vocabulary_id(Course level that the vocabulary belongs to) :bigint           not null
#  vocabulary_id(Vocabulary that belongs to the course)                    :bigint           not null
#
# Indexes
#
#  idx_on_course_level_vocabulary_id_0541fec786                (course_level_vocabulary_id)
#  idx_on_course_level_vocabulary_id_vocabulary_id_ce05887709  (course_level_vocabulary_id,vocabulary_id) UNIQUE
#  index_course_level_vocabulary_links_on_vocabulary_id        (vocabulary_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_level_vocabulary_id => course_level_vocabularies.id)
#  fk_rails_...  (vocabulary_id => vocabularies.id)
#
class CourseLevelVocabularyLink < ApplicationRecord
  belongs_to :course_level_vocabulary
  belongs_to :vocabulary

  has_many :user_course_level_vocabulary_links, dependent: :destroy

  validates :course_level_vocabulary_id, uniqueness: { scope: :vocabulary_id }
  validates :is_published, inclusion: { in: [true, false] }
end
