# == Schema Information
#
# Table name: kanjis
#
#  id                                                              :bigint           not null, primary key
#  kunyomi_readings(Kunyomi readings of the kanji (e.g, ['あい'])) :string           default([]), is an Array
#  onyomi_readings(Onyomi readings of the kanji (e.g, ['あい']))   :string           default([]), is an Array
#  slug(Slug of the kanji (e.g, '愛-ai'))                          :string
#  title(Title of the kanji (e.g, '愛'))                           :string
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#
# Indexes
#
#  index_kanjis_on_slug   (slug) UNIQUE
#  index_kanjis_on_title  (title) UNIQUE
#
require "test_helper"

class KanjiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
