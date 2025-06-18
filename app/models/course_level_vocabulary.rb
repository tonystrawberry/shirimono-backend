# == Schema Information
#
# Table name: course_level_vocabularies
#
#  id                                                                       :bigint           not null, primary key
#  course_level_vocabulary_links_count(Number of vocabularies in the level) :integer          default(0), not null
#  description(Description of the vocabulary level)                         :text
#  position(Position of the level in the course)                            :integer          not null
#  title(Title of the vocabulary level)                                     :string
#  created_at                                                               :datetime         not null
#  updated_at                                                               :datetime         not null
#  course_id(Course the level belongs to)                                   :bigint           not null
#
# Indexes
#
#  index_course_level_vocabularies_on_course_id               (course_id)
#  index_course_level_vocabularies_on_course_id_and_position  (course_id,position) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
class CourseLevelVocabulary < ApplicationRecord
  translates :title, :description

  belongs_to :course

  has_many :course_level_vocabulary_links, dependent: :destroy
  has_many :vocabularies, through: :course_level_vocabulary_links
  has_many :vocabulary_exercises, through: :vocabularies
  has_many :user_course_level_vocabularies, dependent: :destroy
  has_many :user_courses, through: :user_course_level_vocabularies

  validates :title, presence: true
  validates :position, presence: true, uniqueness: { scope: [:course_id] }
  validates :course_level_vocabulary_links_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
