module Api
  module V1
    class PointOfTheDaysController < ApplicationController
      def today
        @point_of_the_day = PointOfTheDay.includes(point: :example_sentences)
                                        .find_by!(featured_on: Date.today)
      end
    end
  end
end