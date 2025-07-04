# == Schema Information
#
# Table name: user_courses
#
#  id                                                                :bigint           not null, primary key
#  user_review_grammars_count(Number of grammar user reviews)        :integer          default(0), not null
#  user_review_kanjis_count(Number of kanji user reviews)            :integer          default(0), not null
#  user_review_vocabularies_count(Number of vocabulary user reviews) :integer          default(0), not null
#  created_at                                                        :datetime         not null
#  updated_at                                                        :datetime         not null
#  course_id(Course that the user belongs to)                        :bigint           not null
#  user_id(User that the course belongs to)                          :bigint           not null
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

  has_many :user_course_level_kanjis, dependent: :destroy
  has_many :course_level_kanjis, through: :user_course_level_kanjis
  has_many :user_course_level_kanji_links, through: :user_course_level_kanjis
  has_many :user_course_level_grammars, dependent: :destroy
  has_many :course_level_grammars, through: :user_course_level_grammars
  has_many :user_course_level_grammar_links, through: :user_course_level_grammars
  has_many :user_course_level_vocabularies, dependent: :destroy
  has_many :course_level_vocabularies, through: :user_course_level_vocabularies
  has_many :user_course_level_vocabulary_links, through: :user_course_level_vocabularies

  # Return the number of kanjis that the user has reviewed
  # @return [Integer] The number of kanjis that the user has reviewed
  def kanjis_count
    user_course_level_kanji_links.count
  end

  # Return the number of grammars that the user has reviewed
  # @return [Integer] The number of grammars that the user has reviewed
  def grammars_count
    user_course_level_grammar_links.count
  end

  # Return the number of vocabularies that the user has reviewed
  # @return [Integer] The number of vocabularies that the user has reviewed
  def vocabularies_count
    user_course_level_vocabulary_links.count
  end
end
