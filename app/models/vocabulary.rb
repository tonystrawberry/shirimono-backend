# == Schema Information
#
# Table name: vocabularies
#
#  id                                               :bigint           not null, primary key
#  kana(Kana of the vocabulary (e.g, 'あい'))       :string
#  meanings(Meanings of the vocabulary)             :string           default(NULL), not null, is an Array
#  slug(Slug of the vocabulary (e.g, '愛-ai'))      :string
#  title(Title of the vocabulary (e.g, '愛'))       :string
#  types(Types of the vocabulary (e.g, ['t_noun'])) :string           default([]), is an Array
#  created_at                                       :datetime         not null
#  updated_at                                       :datetime         not null
#
# Indexes
#
#  index_vocabularies_on_slug   (slug) UNIQUE
#  index_vocabularies_on_title  (title) UNIQUE
#
class Vocabulary < ApplicationRecord
  translates :meanings

  has_many :course_vocabularies, dependent: :destroy
  has_many :courses, through: :course_vocabularies
end
