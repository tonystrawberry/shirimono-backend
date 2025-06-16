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
class UserCourseLevel < ApplicationRecord
  belongs_to :user_course
  belongs_to :course_level

  has_many :kanji_exercises, through: :course_level
  has_many :vocabulary_exercises, through: :course_level
  has_many :grammar_exercises, through: :course_level
  has_many :user_review_kanjis, dependent: :destroy
  has_many :user_review_grammars, dependent: :destroy
  has_many :user_review_vocabularies, dependent: :destroy

  delegate :user, to: :user_course
  delegate :course, to: :user_course

  enum :status, {
    ready: 0,                 # Initial state, ready to start
    lessons_not_completed: 1, # User has started but not completed all lessons
    in_progress: 2,           # All lessons completed, working on exercises
    in_progress_advanced: 3,  # Working on advanced exercises
    done: 4                   # All exercises completed with required mastery
  }, prefix: true

  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :user_course_id, uniqueness: { scope: :course_level_id,
    message: "user already has progress for this course level" }
end
