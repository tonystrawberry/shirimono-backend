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

  has_many :course_kanjis, dependent: :destroy
  has_many :kanjis, through: :course_kanjis

  has_many :course_grammars, dependent: :destroy
  has_many :grammars, through: :course_grammars

  has_many :course_vocabularies, dependent: :destroy
  has_many :vocabularies, through: :course_vocabularies
end
