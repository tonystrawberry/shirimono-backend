# == Schema Information
#
# Table name: grammars
#
#  id                                               :bigint           not null, primary key
#  meanings(Meanings of the grammar)                :string           default(NULL), not null, is an Array
#  slug(Slug of the grammar (e.g, 'ために-tameni')) :string
#  title(Title of the grammar (e.g, 'ために'))      :string
#  created_at                                       :datetime         not null
#  updated_at                                       :datetime         not null
#
# Indexes
#
#  index_grammars_on_slug   (slug) UNIQUE
#  index_grammars_on_title  (title) UNIQUE
#
class Grammar < ApplicationRecord
  translates :meanings

  has_many :course_level_grammars, dependent: :destroy
  has_many :course_levels, through: :course_level_grammars
  has_many :courses, through: :course_levels

  has_many :example_sentence_grammars, dependent: :destroy
  has_many :example_sentences, through: :example_sentence_grammars
  has_many :point_of_the_days, as: :point, dependent: :destroy
  has_many :grammar_exercises, dependent: :destroy

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :meanings, presence: true
end
