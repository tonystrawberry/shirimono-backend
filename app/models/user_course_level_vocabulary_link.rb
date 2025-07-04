# == Schema Information
#
# Table name: user_course_level_vocabulary_links
#
#  id                                                                                                                       :bigint           not null, primary key
#  status(Status of the user course level vocabulary (e.g. not_started, partially_in_progress, all_in_progress, completed)) :integer          default("not_started"), not null
#  user_review_vocabularies_count(Number of user reviews for the user course level vocabulary)                              :integer          default(0), not null
#  created_at                                                                                                               :datetime         not null
#  updated_at                                                                                                               :datetime         not null
#  course_level_vocabulary_link_id(CourseLevelVocabulary that the vocabulary belongs to)                                    :bigint           not null
#  user_course_level_vocabulary_id(UserCourseLevelVocabulary that the vocabulary belongs to)                                :bigint           not null
#
# Indexes
#
#  idx_on_course_level_vocabulary_link_id_e343d47419  (course_level_vocabulary_link_id)
#  idx_on_user_course_level_vocabulary_id_055b117a25  (user_course_level_vocabulary_id)
#  index_user_course_level_vocabulary_links_unique    (user_course_level_vocabulary_id,course_level_vocabulary_link_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (course_level_vocabulary_link_id => course_level_vocabulary_links.id)
#  fk_rails_...  (user_course_level_vocabulary_id => user_course_level_vocabularies.id)
#
class UserCourseLevelVocabularyLink < ApplicationRecord
  belongs_to :course_level_vocabulary_link
  belongs_to :user_course_level_vocabulary

  has_many :user_review_vocabularies, dependent: :destroy

  enum :status, {
    not_started: 0,
    partially_in_progress: 1,
    all_in_progress: 2,
    completed: 3
  }, prefix: true

  counter_culture :user_course_level_vocabulary

  delegate :course, to: :course_level_vocabulary_link
  delegate :course_level_vocabulary, to: :course_level_vocabulary_link
end
