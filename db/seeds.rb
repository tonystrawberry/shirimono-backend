ActiveRecord::Base.transaction do
  require_relative 'seeds/user'
  require_relative 'seeds/course'
  require_relative 'seeds/user_course'
  require_relative 'seeds/kanji'
  require_relative 'seeds/vocabulary'
  require_relative 'seeds/grammar'
  require_relative 'seeds/kanji_pair'
  require_relative 'seeds/vocabulary_pair'
  require_relative 'seeds/point_of_the_day'
  require_relative 'seeds/example_sentence'
end
