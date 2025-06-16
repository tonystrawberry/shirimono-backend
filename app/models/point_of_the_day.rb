# == Schema Information
#
# Table name: point_of_the_days
#
#  id          :bigint           not null, primary key
#  featured_on :date             not null
#  point_type  :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  point_id    :bigint           not null
#
# Indexes
#
#  index_point_of_the_days_on_featured_on  (featured_on) UNIQUE
#  index_point_of_the_days_on_point        (point_type,point_id)
#
class PointOfTheDay < ApplicationRecord
  belongs_to :point, polymorphic: true

  validates :featured_on, presence: true, uniqueness: true
  validate :point_must_be_of_valid_type

  private

  # Called on :validate.
  # Ensure that the point is a valid type.
  def point_must_be_of_valid_type
    unless point.is_a?(Kanji) || point.is_a?(Vocabulary) || point.is_a?(Grammar)
      errors.add(:point, 'must be a Kanji, Vocabulary, or Grammar')
    end
  end
end
