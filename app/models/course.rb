# == Schema Information
#
# Table name: courses
#
#  id                                          :bigint           not null, primary key
#  slug(Slug of the course (e.g, 'n5'))        :string
#  title(Title of the course (e.g. 'JLPT N5')) :string
#  created_at                                  :datetime         not null
#  updated_at                                  :datetime         not null
#
class Course < ApplicationRecord
  translates :title

  has_many :course_kanjis, dependent: :destroy
  has_many :kanjis, through: :course_kanjis

  has_many :course_grammars, dependent: :destroy
  has_many :grammars, through: :course_grammars

  has_many :course_vocabularies, dependent: :destroy
  has_many :vocabularies, through: :course_vocabularies
end
