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
end
