# == Schema Information
#
# Table name: courses
#
#  id                                                       :bigint           not null, primary key
#  grammars_count(Number of grammars in the course)         :integer          default(0), not null
#  kanjis_count(Number of kanjis in the course)             :integer          default(0), not null
#  slug(Slug of the course (e.g, 'n5'))                     :string
#  title(Title of the course (e.g. 'JLPT N5'))              :string
#  vocabularies_count(Number of vocabularies in the course) :integer          default(0), not null
#  created_at                                               :datetime         not null
#  updated_at                                               :datetime         not null
#
class Course < ApplicationRecord
  translates :title

  has_many :course_levels, dependent: :destroy
  has_many :course_level_kanjis, through: :course_levels
  has_many :kanjis, through: :course_level_kanjis
  has_many :course_level_vocabularies, through: :course_levels
  has_many :vocabularies, through: :course_level_vocabularies
  has_many :course_level_grammars, through: :course_levels
  has_many :grammars, through: :course_level_grammars
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :kanjis_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :vocabularies_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :grammars_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Refresh the counts of the course
  # @return [void]
  def refresh_counts
    self.kanjis_count = kanjis.count
    self.vocabularies_count = vocabularies.count
    self.grammars_count = grammars.count
    save!
  end
end
