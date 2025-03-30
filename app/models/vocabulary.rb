# == Schema Information
#
# Table name: vocabularies
#
#  id                                               :bigint           not null, primary key
#  kana(Kana of the vocabulary (e.g, 'あい'))       :string
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
end
