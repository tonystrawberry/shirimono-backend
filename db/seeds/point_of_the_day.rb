# db/seeds/point_of_the_day.rb
kanjis = Kanji.all.to_a
vocabularies = Vocabulary.all.to_a
grammars = Grammar.all.to_a
points = (kanjis + vocabularies + grammars).shuffle

100.times do |i|
  point = points[i % points.size]
  PointOfTheDay.find_or_create_by!(
    featured_on: Date.today + i
  ) do |point_of_the_day|
    point_of_the_day.point = point
  end
end