# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create JLPT courses
courses = {
  n5: { title: "JLPT N5", slug: "n5" },
  n4: { title: "JLPT N4", slug: "n4" },
  n3: { title: "JLPT N3", slug: "n3" },
  n2: { title: "JLPT N2", slug: "n2" },
  n1: { title: "JLPT N1", slug: "n1" }
}.map do |key, data|
  Course.find_or_create_by!(slug: data[:slug]) do |course|
    course.title = data[:title]
  end
end

# Sample N5 content
n5 = courses[0] # N5

# N5 Course Levels
n5_kanji_level1 = CourseLevel.find_or_create_by!(course: n5, point_type: :kanji, position: 1) do |level|
  level.title = "Basic Kanji 1"
  level.description = "First set of basic kanji including numbers and everyday concepts"
end

n5_kanji_level2 = CourseLevel.find_or_create_by!(course: n5, point_type: :kanji, position: 2) do |level|
  level.title = "Basic Kanji 2"
  level.description = "Second set of basic kanji including common verbs and adjectives"
end

n5_vocab_level1 = CourseLevel.find_or_create_by!(course: n5, point_type: :vocabulary, position: 1) do |level|
  level.title = "Essential Vocabulary 1"
  level.description = "Basic pronouns and everyday nouns"
end

n5_vocab_level2 = CourseLevel.find_or_create_by!(course: n5, point_type: :vocabulary, position: 2) do |level|
  level.title = "Essential Vocabulary 2"
  level.description = "Common verbs and basic expressions"
end

n5_grammar_level1 = CourseLevel.find_or_create_by!(course: n5, point_type: :grammar, position: 1) do |level|
  level.title = "Basic Grammar 1"
  level.description = "Fundamental sentence structures and particles"
end

# N5 Kanji
n5_kanjis = [
  { title: "日", slug: "日-hi", kunyomi_readings: ["ひ", "び", "か"], onyomi_readings: ["ニチ", "ジツ"], meanings: ["day", "sun"], level: n5_kanji_level1 },
  { title: "本", slug: "本-hon", kunyomi_readings: ["もと"], onyomi_readings: ["ホン"], meanings: ["book", "origin", "real"], level: n5_kanji_level1 },
  { title: "人", slug: "人-jin", kunyomi_readings: ["ひと"], onyomi_readings: ["ジン", "ニン"], meanings: ["person", "people"], level: n5_kanji_level2 }
].map do |data|
  kanji = Kanji.find_or_create_by!(slug: data[:slug]) do |k|
    k.title = data[:title]
    k.kunyomi_readings = data[:kunyomi_readings]
    k.onyomi_readings = data[:onyomi_readings]
    k.meanings = data[:meanings]
  end

  CourseLevelKanji.find_or_create_by!(course_level: data[:level], kanji: kanji)
  kanji
end

# N5 Grammar
n5_grammars = [
  { title: "です", slug: "です-desu", meanings: ["to be", "is"], level: n5_grammar_level1 },
  { title: "ます", slug: "ます-masu", meanings: ["polite verb ending"], level: n5_grammar_level1 },
  { title: "から", slug: "から-kara", meanings: ["because", "from"], level: n5_grammar_level1 }
].map do |data|
  grammar = Grammar.find_or_create_by!(slug: data[:slug]) do |g|
    g.title = data[:title]
    g.meanings = data[:meanings]
  end

  CourseLevelGrammar.find_or_create_by!(course_level: data[:level], grammar: grammar)
  grammar
end

# N5 Vocabulary
n5_vocabularies = [
  { title: "私", slug: "私-watashi", kana: "わたし", meanings: ["I", "me"], types: ["pronoun"], level: n5_vocab_level1 },
  { title: "学生", slug: "学生-gakusei", kana: "がくせい", meanings: ["student"], types: ["noun"], level: n5_vocab_level1 },
  { title: "先生", slug: "先生-sensei", kana: "せんせい", meanings: ["teacher", "instructor"], types: ["noun"], level: n5_vocab_level2 }
].map do |data|
  vocabulary = Vocabulary.find_or_create_by!(slug: data[:slug]) do |v|
    v.title = data[:title]
    v.kana = data[:kana]
    v.meanings = data[:meanings]
    v.types = data[:types]
  end

  CourseLevelVocabulary.find_or_create_by!(course_level: data[:level], vocabulary: vocabulary)
  vocabulary
end

# Sample N4 content
n4 = courses[1] # N4

# N4 Course Levels
n4_kanji_level1 = CourseLevel.find_or_create_by!(course: n4, point_type: :kanji, position: 1) do |level|
  level.title = "Intermediate Kanji 1"
  level.description = "First set of intermediate kanji for N4"
end

n4_vocab_level1 = CourseLevel.find_or_create_by!(course: n4, point_type: :vocabulary, position: 1) do |level|
  level.title = "Intermediate Vocabulary 1"
  level.description = "Common compound words and expressions"
end

n4_grammar_level1 = CourseLevel.find_or_create_by!(course: n4, point_type: :grammar, position: 1) do |level|
  level.title = "Intermediate Grammar 1"
  level.description = "Advanced sentence patterns and expressions"
end

# N4 Kanji
n4_kanjis = [
  { title: "親", slug: "親-oya", kunyomi_readings: ["おや"], onyomi_readings: ["シン"], meanings: ["parent", "intimate"], level: n4_kanji_level1 },
  { title: "切", slug: "切-kiri", kunyomi_readings: ["き"], onyomi_readings: ["セツ", "サイ"], meanings: ["cut", "crucial"], level: n4_kanji_level1 }
].map do |data|
  kanji = Kanji.find_or_create_by!(slug: data[:slug]) do |k|
    k.title = data[:title]
    k.kunyomi_readings = data[:kunyomi_readings]
    k.onyomi_readings = data[:onyomi_readings]
    k.meanings = data[:meanings]
  end

  CourseLevelKanji.find_or_create_by!(course_level: data[:level], kanji: kanji)
  kanji
end

# N4 Grammar
n4_grammars = [
  { title: "そうです", slug: "そうです-soudesu", meanings: ["seems like", "appears to be"], level: n4_grammar_level1 },
  { title: "てしまう", slug: "てしまう-teshimau", meanings: ["to finish completely", "to do something by accident"], level: n4_grammar_level1 }
].map do |data|
  grammar = Grammar.find_or_create_by!(slug: data[:slug]) do |g|
    g.title = data[:title]
    g.meanings = data[:meanings]
  end

  CourseLevelGrammar.find_or_create_by!(course_level: data[:level], grammar: grammar)
  grammar
end

# N4 Vocabulary
n4_vocabularies = [
  { title: "経験", slug: "経験-keiken", kana: "けいけん", meanings: ["experience"], types: ["noun"], level: n4_vocab_level1 },
  { title: "結婚", slug: "結婚-kekkon", kana: "けっこん", meanings: ["marriage"], types: ["noun", "suru_verb"], level: n4_vocab_level1 }
].map do |data|
  vocabulary = Vocabulary.find_or_create_by!(slug: data[:slug]) do |v|
    v.title = data[:title]
    v.kana = data[:kana]
    v.meanings = data[:meanings]
    v.types = data[:types]
  end

  CourseLevelVocabulary.find_or_create_by!(course_level: data[:level], vocabulary: vocabulary)
  vocabulary
end

# Sample N3 content
n3 = courses[2] # N3

# N3 Course Levels
n3_kanji_level1 = CourseLevel.find_or_create_by!(course: n3, point_type: :kanji, position: 1) do |level|
  level.title = "Advanced Kanji 1"
  level.description = "First set of advanced kanji for N3"
end

n3_vocab_level1 = CourseLevel.find_or_create_by!(course: n3, point_type: :vocabulary, position: 1) do |level|
  level.title = "Advanced Vocabulary 1"
  level.description = "Advanced compound words and formal expressions"
end

n3_grammar_level1 = CourseLevel.find_or_create_by!(course: n3, point_type: :grammar, position: 1) do |level|
  level.title = "Advanced Grammar 1"
  level.description = "Complex sentence patterns and formal expressions"
end

# N3 Kanji
n3_kanjis = [
  { title: "織", slug: "織-ori", kunyomi_readings: ["お"], onyomi_readings: ["シキ"], meanings: ["weave", "fabric"], level: n3_kanji_level1 },
  { title: "績", slug: "績-seki", kunyomi_readings: ["せき"], onyomi_readings: ["セキ"], meanings: ["performance", "results"], level: n3_kanji_level1 }
].map do |data|
  kanji = Kanji.find_or_create_by!(slug: data[:slug]) do |k|
    k.title = data[:title]
    k.kunyomi_readings = data[:kunyomi_readings]
    k.onyomi_readings = data[:onyomi_readings]
    k.meanings = data[:meanings]
  end

  CourseLevelKanji.find_or_create_by!(course_level: data[:level], kanji: kanji)
  kanji
end

# N3 Grammar
n3_grammars = [
  { title: "によって", slug: "によって-niyotte", meanings: ["by means of", "depending on"], level: n3_grammar_level1 },
  { title: "わけがない", slug: "わけがない-wakegaai", meanings: ["there is no way that", "cannot possibly be"], level: n3_grammar_level1 }
].map do |data|
  grammar = Grammar.find_or_create_by!(slug: data[:slug]) do |g|
    g.title = data[:title]
    g.meanings = data[:meanings]
  end

  CourseLevelGrammar.find_or_create_by!(course_level: data[:level], grammar: grammar)
  grammar
end

# N3 Vocabulary
n3_vocabularies = [
  { title: "解決", slug: "解決-kaiketsu", kana: "かいけつ", meanings: ["solution", "resolution"], types: ["noun", "suru_verb"], level: n3_vocab_level1 },
  { title: "提案", slug: "提案-teian", kana: "ていあん", meanings: ["proposal", "suggestion"], types: ["noun", "suru_verb"], level: n3_vocab_level1 }
].map do |data|
  vocabulary = Vocabulary.find_or_create_by!(slug: data[:slug]) do |v|
    v.title = data[:title]
    v.kana = data[:kana]
    v.meanings = data[:meanings]
    v.types = data[:types]
  end

  CourseLevelVocabulary.find_or_create_by!(course_level: data[:level], vocabulary: vocabulary)
  vocabulary
end

# Sample N2 content
n2 = courses[3] # N2

# N2 Course Levels
n2_kanji_level1 = CourseLevel.find_or_create_by!(course: n2, point_type: :kanji, position: 1) do |level|
  level.title = "Business Kanji 1"
  level.description = "Advanced kanji commonly used in business and formal writing"
end

n2_vocab_level1 = CourseLevel.find_or_create_by!(course: n2, point_type: :vocabulary, position: 1) do |level|
  level.title = "Business Vocabulary 1"
  level.description = "Advanced vocabulary for professional contexts"
end

n2_grammar_level1 = CourseLevel.find_or_create_by!(course: n2, point_type: :grammar, position: 1) do |level|
  level.title = "Advanced Grammar 1"
  level.description = "Complex grammatical patterns for formal expression"
end

# N2 Kanji
n2_kanjis = [
  { title: "憂", slug: "憂-yu", kunyomi_readings: ["うれ"], onyomi_readings: ["ユウ"], meanings: ["worry", "anxiety"], level: n2_kanji_level1 },
  { title: "謙", slug: "謙-ken", kunyomi_readings: [], onyomi_readings: ["ケン"], meanings: ["modesty", "humble"], level: n2_kanji_level1 }
].map do |data|
  kanji = Kanji.find_or_create_by!(slug: data[:slug]) do |k|
    k.title = data[:title]
    k.kunyomi_readings = data[:kunyomi_readings]
    k.onyomi_readings = data[:onyomi_readings]
    k.meanings = data[:meanings]
  end

  CourseLevelKanji.find_or_create_by!(course_level: data[:level], kanji: kanji)
  kanji
end

# N2 Grammar
n2_grammars = [
  { title: "にもかかわらず", slug: "にもかかわらず-nimokakawarazu", meanings: ["despite", "nevertheless"], level: n2_grammar_level1 },
  { title: "つつある", slug: "つつある-tsutsuaru", meanings: ["in the process of", "while doing"], level: n2_grammar_level1 }
].map do |data|
  grammar = Grammar.find_or_create_by!(slug: data[:slug]) do |g|
    g.title = data[:title]
    g.meanings = data[:meanings]
  end

  CourseLevelGrammar.find_or_create_by!(course_level: data[:level], grammar: grammar)
  grammar
end

# N2 Vocabulary
n2_vocabularies = [
  { title: "概念", slug: "概念-gainen", kana: "がいねん", meanings: ["concept", "notion"], types: ["noun"], level: n2_vocab_level1 },
  { title: "傾向", slug: "傾向-keikou", kana: "けいこう", meanings: ["tendency", "trend"], types: ["noun"], level: n2_vocab_level1 }
].map do |data|
  vocabulary = Vocabulary.find_or_create_by!(slug: data[:slug]) do |v|
    v.title = data[:title]
    v.kana = data[:kana]
    v.meanings = data[:meanings]
    v.types = data[:types]
  end

  CourseLevelVocabulary.find_or_create_by!(course_level: data[:level], vocabulary: vocabulary)
  vocabulary
end

# Sample N1 content
n1 = courses[4] # N1

# N1 Course Levels
n1_kanji_level1 = CourseLevel.find_or_create_by!(course: n1, point_type: :kanji, position: 1) do |level|
  level.title = "Literary Kanji 1"
  level.description = "Advanced kanji used in literature and academic writing"
end

n1_vocab_level1 = CourseLevel.find_or_create_by!(course: n1, point_type: :vocabulary, position: 1) do |level|
  level.title = "Academic Vocabulary 1"
  level.description = "Sophisticated vocabulary for academic and literary contexts"
end

n1_grammar_level1 = CourseLevel.find_or_create_by!(course: n1, point_type: :grammar, position: 1) do |level|
  level.title = "Expert Grammar 1"
  level.description = "Complex and nuanced grammatical expressions"
end

# N1 Kanji
n1_kanjis = [
  { title: "憤", slug: "憤-fun", kunyomi_readings: ["いきどお"], onyomi_readings: ["フン"], meanings: ["resent", "indignation"], level: n1_kanji_level1 },
  { title: "遵", slug: "遵-jun", kunyomi_readings: [], onyomi_readings: ["ジュン"], meanings: ["abide by", "follow"], level: n1_kanji_level1 }
].map do |data|
  kanji = Kanji.find_or_create_by!(slug: data[:slug]) do |k|
    k.title = data[:title]
    k.kunyomi_readings = data[:kunyomi_readings]
    k.onyomi_readings = data[:onyomi_readings]
    k.meanings = data[:meanings]
  end

  CourseLevelKanji.find_or_create_by!(course_level: data[:level], kanji: kanji)
  kanji
end

# N1 Grammar
n1_grammars = [
  { title: "をもって", slug: "をもって-womotte", meanings: ["with", "by means of", "as of"], level: n1_grammar_level1 },
  { title: "に至っては", slug: "に至っては-niitatte", meanings: ["as for", "when it comes to"], level: n1_grammar_level1 }
].map do |data|
  grammar = Grammar.find_or_create_by!(slug: data[:slug]) do |g|
    g.title = data[:title]
    g.meanings = data[:meanings]
  end

  CourseLevelGrammar.find_or_create_by!(course_level: data[:level], grammar: grammar)
  grammar
end

# N1 Vocabulary
n1_vocabularies = [
  { title: "措置", slug: "措置-sochi", kana: "そち", meanings: ["measure", "step"], types: ["noun", "suru_verb"], level: n1_vocab_level1 },
  { title: "見解", slug: "見解-kenkai", kana: "けんかい", meanings: ["opinion", "point of view"], types: ["noun"], level: n1_vocab_level1 }
].map do |data|
  vocabulary = Vocabulary.find_or_create_by!(slug: data[:slug]) do |v|
    v.title = data[:title]
    v.kana = data[:kana]
    v.meanings = data[:meanings]
    v.types = data[:types]
  end

  CourseLevelVocabulary.find_or_create_by!(course_level: data[:level], vocabulary: vocabulary)
  vocabulary
end

# Create dummy users
users = [
  { email: "student1@example.com", name: "Student One", password: "password123" },
  { email: "student2@example.com", name: "Student Two", password: "password123" },
  { email: "student3@example.com", name: "Student Three", password: "password123" }
].map do |data|
  User.find_or_create_by!(email: data[:email]) do |user|
    user.name = data[:name]
    user.password = data[:password]
  end
end

# Create user courses and reviews
users.each do |user|
  # Enroll in N5 and N4
  [n5, n4].each do |course|
    user_course = UserCourse.find_or_create_by!(user: user, course: course)

    # Create reviews for each course level
    course.course_levels.each do |level|
      # Create kanji reviews
      level.kanjis.each do |kanji|
        next if rand > 0.7 # 70% chance to create a review

        UserReview.find_or_create_by!(
          user_course: user_course,
          course_point: level.course_level_kanjis.find_by(kanji: kanji)
        ) do |review|
          review.memorization_status = rand(0..6)
          review.number_of_total_reviews = rand(1..10)
          review.number_of_correct_reviews = rand(0..review.number_of_total_reviews)
          review.next_review_at = Time.current + rand(1..7).days
        end
      end

      # Create grammar reviews
      level.grammars.each do |grammar|
        next if rand > 0.7 # 70% chance to create a review

        UserReview.find_or_create_by!(
          user_course: user_course,
          course_point: level.course_level_grammars.find_by(grammar: grammar)
        ) do |review|
          review.memorization_status = rand(0..6)
          review.number_of_total_reviews = rand(1..10)
          review.number_of_correct_reviews = rand(0..review.number_of_total_reviews)
          review.next_review_at = Time.current + rand(1..7).days
        end
      end

      # Create vocabulary reviews
      level.vocabularies.each do |vocabulary|
        next if rand > 0.7 # 70% chance to create a review

        UserReview.find_or_create_by!(
          user_course: user_course,
          course_point: level.course_level_vocabularies.find_by(vocabulary: vocabulary)
        ) do |review|
          review.memorization_status = rand(0..6)
          review.number_of_total_reviews = rand(1..10)
          review.number_of_correct_reviews = rand(0..review.number_of_total_reviews)
          review.next_review_at = Time.current + rand(1..7).days
        end
      end
    end
  end
end

# Create example sentences
example_sentences = [
  {
    sentence: "私は学生です。",
    sentence_html: "<ruby>私<rt>わたし</rt></ruby>は<ruby>学生<rt>がくせい</rt></ruby>です。",
    translation: "I am a student.",
    points: [n5_vocabularies[0], n5_vocabularies[1]] # 私, 学生
  },
  {
    sentence: "先生は本を読みます。",
    sentence_html: "<ruby>先生<rt>せんせい</rt></ruby>は<ruby>本<rt>ほん</rt></ruby>を<ruby>読<rt>よ</rt></ruby>みます。",
    translation: "The teacher reads a book.",
    points: [n5_vocabularies[2], n5_kanjis[1]] # 先生, 本
  }
].map do |data|
  sentence = ExampleSentence.find_or_create_by!(sentence: data[:sentence]) do |s|
    s.sentence_html = data[:sentence_html]
    s.translation = data[:translation]
  end

  data[:points].each do |point|
    if point.is_a?(Kanji)
      ExampleSentenceKanji.find_or_create_by!(example_sentence: sentence, kanji: point)
    elsif point.is_a?(Vocabulary)
      ExampleSentenceVocabulary.find_or_create_by!(example_sentence: sentence, vocabulary: point)
    end
  end

  sentence
end

# Create kanji pairs (connecting all kanjis within their JLPT level)
[
  n5_kanjis,
  n4_kanjis,
  n3_kanjis,
  n2_kanjis,
  n1_kanjis
].each do |level_kanjis|
  level_kanjis.each_with_index do |kanji_1, index|
    level_kanjis[(index + 1)..-1].each do |kanji_2|
      KanjiPair.find_or_create_by!(kanji_1: kanji_1, kanji_2: kanji_2)
    end
  end
end

# Create vocabulary pairs (both synonyms and antonyms within their JLPT level)
[
  n5_vocabularies,
  n4_vocabularies,
  n3_vocabularies,
  n2_vocabularies,
  n1_vocabularies
].each do |level_vocabularies|
  level_vocabularies.each_with_index do |vocab_1, index|
    level_vocabularies[(index + 1)..-1].each do |vocab_2|
      # Create synonym pairs for consecutive vocabularies
      if index.even? && level_vocabularies[index + 1] == vocab_2
        VocabularyPair.find_or_create_by!(
          vocabulary_1: vocab_1,
          vocabulary_2: vocab_2,
          pair_type: :synonym
        )
      # Create antonym pairs for all other combinations
      else
        VocabularyPair.find_or_create_by!(
          vocabulary_1: vocab_1,
          vocabulary_2: vocab_2,
          pair_type: :antonym
        )
      end
    end
  end
end

# Load all seed files from db/seeds directory
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end

# Load additional seed files
require_relative "seeds/example_sentences"
require_relative "seeds/point_of_the_days"
require_relative "seeds/kanji_exercises"
require_relative "seeds/vocabulary_exercises"
require_relative "seeds/grammar_exercises"
