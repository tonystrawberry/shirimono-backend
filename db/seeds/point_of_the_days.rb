puts 'Creating points of the day...'

# Get all available points
kanjis = Kanji.all.to_a
vocabularies = Vocabulary.all.to_a
grammars = Grammar.all.to_a

# Combine all points and shuffle them
all_points = []

# We'll add points in a ratio of 2:2:1 (kanji:vocabulary:grammar)
2.times { all_points.concat(kanjis) }    # More weight on kanji
2.times { all_points.concat(vocabularies) } # More weight on vocabulary
1.times { all_points.concat(grammars) }    # Less weight on grammar

all_points.shuffle!

# Create a point of the day for the next 365 days
365.times do |i|
  date = Date.today + i.days

  # Get a point (cycling through the shuffled array)
  point = all_points[i % all_points.length]

  PointOfTheDay.find_or_create_by!(featured_on: date) do |potd|
    potd.point = point
  end
end

puts "Created points of the day for #{PointOfTheDay.count} days"

# Print some statistics
kanji_count = PointOfTheDay.where(point_type: 'Kanji').count
vocab_count = PointOfTheDay.where(point_type: 'Vocabulary').count
grammar_count = PointOfTheDay.where(point_type: 'Grammar').count

puts "\nDistribution:"
puts "Kanji: #{kanji_count} days"
puts "Vocabulary: #{vocab_count} days"
puts "Grammar: #{grammar_count} days"