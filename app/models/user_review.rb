# == Schema Information
#
# Table name: user_reviews
#
#  id                                                                                         :bigint           not null, primary key
#  course_point_type                                                                          :string           not null
#  memorization_status(Memorization status of the user review)                                :integer          default(0), not null
#  next_review_at(Next review date for the user review)                                       :datetime
#  number_of_correct_reviews(Number of correct reviews the user has made on the course point) :integer          default(0), not null
#  number_of_total_reviews(Number of reviews the user has made on the course point)           :integer          default(0), not null
#  created_at                                                                                 :datetime         not null
#  updated_at                                                                                 :datetime         not null
#  course_point_id(Course point that the review belongs to)                                   :bigint           not null
#  user_id(User the review belongs to)                                                        :bigint           not null
#
# Indexes
#
#  index_user_reviews_on_course_point  (course_point_type,course_point_id)
#  index_user_reviews_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserReview < ApplicationRecord
end
