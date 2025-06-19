class CourseLevelKanjiDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def points
    object.kanjis.map do |kanji|
      {
        id: kanji.id,
        title: kanji.title,
        meanings: kanji.meanings,
        kunyomi_readings: kanji.kunyomi_readings,
        onyomi_readings: kanji.onyomi_readings,
        exercises: kanji.kanji_exercises.map { |exercise| { id: exercise.id } },
      }
    end
  end
end
