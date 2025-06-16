class CourseDecorator < Draper::Decorator
  delegate_all

  def course_level_kanjis_count
    object.course_levels.where(point_type: :kanji).count
  end

  def course_level_vocabularies_count
    object.course_levels.where(point_type: :vocabulary).count
  end

  def course_level_grammars_count
    object.course_levels.where(point_type: :grammar).count
  end

  def progress
    {
      kanjis_count: h.current_user.user_courses.find_by(course: object)&.kanjis_count || 0,
      grammars_count: h.current_user.user_courses.find_by(course: object)&.grammars_count || 0,
      vocabularies_count: h.current_user.user_courses.find_by(course: object)&.vocabularies_count || 0
    }
  end
end
