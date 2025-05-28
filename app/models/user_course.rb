# == Schema Information
#
# Table name: user_courses
#
#  id                                                               :bigint           not null, primary key
#  grammar_user_reviews_count(Number of grammar user reviews)       :integer          default(0), not null
#  kanji_user_reviews_count(Number of kanji user reviews)           :integer          default(0), not null
#  vocabulary_user_reviews_count(Number of vocabulary user reviews) :integer          default(0), not null
#  created_at                                                       :datetime         not null
#  updated_at                                                       :datetime         not null
#  course_id(Course that the user belongs to)                       :bigint           not null
#  user_id(User that the course belongs to)                         :bigint           not null
#
# Indexes
#
#  index_user_courses_on_course_id  (course_id)
#  index_user_courses_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (user_id => users.id)
#
class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :user_reviews, dependent: :destroy
end
