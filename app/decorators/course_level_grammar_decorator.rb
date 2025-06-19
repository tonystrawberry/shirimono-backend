class CourseLevelGrammarDecorator < Draper::Decorator
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
    object.grammars.map do |grammar|
      {
        id: grammar.id,
        title: grammar.title,
        meanings: grammar.meanings,
        exercises: grammar.grammar_exercises.map { |exercise| { id: exercise.id } }
      }
    end
  end
end
