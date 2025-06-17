# == Schema Information
#
# Table name: user_course_level_vocabularies
#
#  id                                                                                                                       :bigint           not null, primary key
#  status(Status of the user course level vocabulary (e.g. not_started, partially_in_progress, all_in_progress, completed)) :integer          default("not_started"), not null
#  user_reviews_vocabularies_count(Number of user reviews for the user course level vocabulary)                             :integer          default(0), not null
#  created_at                                                                                                               :datetime         not null
#  updated_at                                                                                                               :datetime         not null
#  course_level_vocabulary_id(CourseLevelVocabulary that the vocabulary belongs to)                                         :bigint           not null
#  user_course_id(UserCourse that the vocabulary belongs to)                                                                :bigint           not null
#
# Indexes
#
#  idx_on_course_level_vocabulary_id_4be51d041d            (course_level_vocabulary_id)
#  index_user_course_level_vocabularies_on_user_course_id  (user_course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_level_vocabulary_id => course_level_vocabularies.id)
#  fk_rails_...  (user_course_id => user_courses.id)
#
class UserCourseLevelVocabulary < ApplicationRecord
  belongs_to :user_course
  belongs_to :course_level_vocabulary

  has_many :user_review_vocabularies, dependent: :destroy

  enum :status, {
    not_started: 0,
    partially_in_progress: 1,
    all_in_progress: 2,
    completed: 3
  }, prefix: true
end
