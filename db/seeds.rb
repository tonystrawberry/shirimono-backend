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

# N5 Kanji
n5_kanjis = [
  { title: "日", slug: "日-hi", kunyomi_readings: ["ひ", "び", "か"], onyomi_readings: ["ニチ", "ジツ"], meanings: ["day", "sun"] },
  { title: "本", slug: "本-hon", kunyomi_readings: ["もと"], onyomi_readings: ["ホン"], meanings: ["book", "origin", "real"] },
  { title: "人", slug: "人-jin", kunyomi_readings: ["ひと"], onyomi_readings: ["ジン", "ニン"], meanings: ["person", "people"] }
].map do |data|
  kanji = Kanji.find_or_create_by!(slug: data[:slug]) do |k|
    k.title = data[:title]
    k.kunyomi_readings = data[:kunyomi_readings]
    k.onyomi_readings = data[:onyomi_readings]
    k.meanings = data[:meanings]
  end

  CourseKanji.find_or_create_by!(course: n5, kanji: kanji) do |ck|
    ck.is_published = true
  end

  kanji
end

# N5 Grammar
n5_grammars = [
  { title: "です", slug: "です-desu", meanings: ["to be", "is"] },
  { title: "ます", slug: "ます-masu", meanings: ["polite verb ending"] },
  { title: "から", slug: "から-kara", meanings: ["because", "from"] }
].map do |data|
  grammar = Grammar.find_or_create_by!(slug: data[:slug]) do |g|
    g.title = data[:title]
    g.meanings = data[:meanings]
  end

  CourseGrammar.find_or_create_by!(course: n5, grammar: grammar) do |cg|
    cg.is_published = true
  end

  grammar
end

# N5 Vocabulary
n5_vocabularies = [
  { title: "私", slug: "私-watashi", kana: "わたし", meanings: ["I", "me"], types: ["pronoun"] },
  { title: "学生", slug: "学生-gakusei", kana: "がくせい", meanings: ["student"], types: ["noun"] },
  { title: "先生", slug: "先生-sensei", kana: "せんせい", meanings: ["teacher", "instructor"], types: ["noun"] }
].map do |data|
  vocabulary = Vocabulary.find_or_create_by!(slug: data[:slug]) do |v|
    v.title = data[:title]
    v.kana = data[:kana]
    v.meanings = data[:meanings]
    v.types = data[:types]
  end

  CourseVocabulary.find_or_create_by!(course: n5, vocabulary: vocabulary) do |cv|
    cv.is_published = true
  end

  vocabulary
end

# Sample N4 content
n4 = courses[1] # N4

# N4 Kanji
n4_kanjis = [
  { title: "親", slug: "親-oya", kunyomi_readings: ["おや"], onyomi_readings: ["シン"], meanings: ["parent", "intimate"] },
  { title: "切", slug: "切-kiri", kunyomi_readings: ["き"], onyomi_readings: ["セツ", "サイ"], meanings: ["cut", "crucial"] }
].map do |data|
  kanji = Kanji.find_or_create_by!(slug: data[:slug]) do |k|
    k.title = data[:title]
    k.kunyomi_readings = data[:kunyomi_readings]
    k.onyomi_readings = data[:onyomi_readings]
    k.meanings = data[:meanings]
  end

  CourseKanji.find_or_create_by!(course: n4, kanji: kanji) do |ck|
    ck.is_published = true
  end

  kanji
end

# N4 Grammar
n4_grammars = [
  { title: "そうです", slug: "そうです-soudesu", meanings: ["seems like", "appears to be"] },
  { title: "てしまう", slug: "てしまう-teshimau", meanings: ["to finish completely", "to do something by accident"] }
].map do |data|
  grammar = Grammar.find_or_create_by!(slug: data[:slug]) do |g|
    g.title = data[:title]
    g.meanings = data[:meanings]
  end

  CourseGrammar.find_or_create_by!(course: n4, grammar: grammar) do |cg|
    cg.is_published = true
  end

  grammar
end

# N4 Vocabulary
n4_vocabularies = [
  { title: "経験", slug: "経験-keiken", kana: "けいけん", meanings: ["experience"], types: ["noun"] },
  { title: "結婚", slug: "結婚-kekkon", kana: "けっこん", meanings: ["marriage"], types: ["noun", "suru_verb"] }
].map do |data|
  vocabulary = Vocabulary.find_or_create_by!(slug: data[:slug]) do |v|
    v.title = data[:title]
    v.kana = data[:kana]
    v.meanings = data[:meanings]
    v.types = data[:types]
  end

  CourseVocabulary.find_or_create_by!(course: n4, vocabulary: vocabulary) do |cv|
    cv.is_published = true
  end

  vocabulary
end

# Sample N3 content
n3 = courses[2] # N3

# N3 Kanji
n3_kanjis = [
  { title: "織", slug: "織-ori", kunyomi_readings: ["お"], onyomi_readings: ["シキ"], meanings: ["weave", "fabric"] },
  { title: "績", slug: "績-seki", kunyomi_readings: [], onyomi_readings: ["セキ"], meanings: ["performance", "results"] }
].map do |data|
  kanji = Kanji.find_or_create_by!(slug: data[:slug]) do |k|
    k.title = data[:title]
    k.kunyomi_readings = data[:kunyomi_readings]
    k.onyomi_readings = data[:onyomi_readings]
    k.meanings = data[:meanings]
  end

  CourseKanji.find_or_create_by!(course: n3, kanji: kanji) do |ck|
    ck.is_published = true
  end

  kanji
end

# N3 Grammar
n3_grammars = [
  { title: "によって", slug: "によって-niyotte", meanings: ["by means of", "depending on"] },
  { title: "わけがない", slug: "わけがない-wakegaai", meanings: ["there is no way that", "cannot possibly be"] }
].map do |data|
  grammar = Grammar.find_or_create_by!(slug: data[:slug]) do |g|
    g.title = data[:title]
    g.meanings = data[:meanings]
  end

  CourseGrammar.find_or_create_by!(course: n3, grammar: grammar) do |cg|
    cg.is_published = true
  end

  grammar
end

# N3 Vocabulary
n3_vocabularies = [
  { title: "解決", slug: "解決-kaiketsu", kana: "かいけつ", meanings: ["solution", "resolution"], types: ["noun", "suru_verb"] },
  { title: "提案", slug: "提案-teian", kana: "ていあん", meanings: ["proposal", "suggestion"], types: ["noun", "suru_verb"] }
].map do |data|
  vocabulary = Vocabulary.find_or_create_by!(slug: data[:slug]) do |v|
    v.title = data[:title]
    v.kana = data[:kana]
    v.meanings = data[:meanings]
    v.types = data[:types]
  end

  CourseVocabulary.find_or_create_by!(course: n3, vocabulary: vocabulary) do |cv|
    cv.is_published = true
  end

  vocabulary
end

# Sample N2 content
n2 = courses[3] # N2

# N2 Kanji
n2_kanjis = [
  { title: "憂", slug: "憂-yu", kunyomi_readings: ["うれ"], onyomi_readings: ["ユウ"], meanings: ["worry", "anxiety"] },
  { title: "謙", slug: "謙-ken", kunyomi_readings: [], onyomi_readings: ["ケン"], meanings: ["modesty", "humble"] }
].map do |data|
  kanji = Kanji.find_or_create_by!(slug: data[:slug]) do |k|
    k.title = data[:title]
    k.kunyomi_readings = data[:kunyomi_readings]
    k.onyomi_readings = data[:onyomi_readings]
    k.meanings = data[:meanings]
  end

  CourseKanji.find_or_create_by!(course: n2, kanji: kanji) do |ck|
    ck.is_published = true
  end

  kanji
end

# N2 Grammar
n2_grammars = [
  { title: "にもかかわらず", slug: "にもかかわらず-nimokakawarazu", meanings: ["despite", "nevertheless"] },
  { title: "つつある", slug: "つつある-tsutsuaru", meanings: ["in the process of", "while doing"] }
].map do |data|
  grammar = Grammar.find_or_create_by!(slug: data[:slug]) do |g|
    g.title = data[:title]
    g.meanings = data[:meanings]
  end

  CourseGrammar.find_or_create_by!(course: n2, grammar: grammar) do |cg|
    cg.is_published = true
  end

  grammar
end

# N2 Vocabulary
n2_vocabularies = [
  { title: "概念", slug: "概念-gainen", kana: "がいねん", meanings: ["concept", "notion"], types: ["noun"] },
  { title: "傾向", slug: "傾向-keikou", kana: "けいこう", meanings: ["tendency", "trend"], types: ["noun"] }
].map do |data|
  vocabulary = Vocabulary.find_or_create_by!(slug: data[:slug]) do |v|
    v.title = data[:title]
    v.kana = data[:kana]
    v.meanings = data[:meanings]
    v.types = data[:types]
  end

  CourseVocabulary.find_or_create_by!(course: n2, vocabulary: vocabulary) do |cv|
    cv.is_published = true
  end

  vocabulary
end

# Sample N1 content
n1 = courses[4] # N1

# N1 Kanji
n1_kanjis = [
  { title: "憤", slug: "憤-fun", kunyomi_readings: ["いきどお"], onyomi_readings: ["フン"], meanings: ["resent", "indignation"] },
  { title: "遵", slug: "遵-jun", kunyomi_readings: [], onyomi_readings: ["ジュン"], meanings: ["abide by", "follow"] }
].map do |data|
  kanji = Kanji.find_or_create_by!(slug: data[:slug]) do |k|
    k.title = data[:title]
    k.kunyomi_readings = data[:kunyomi_readings]
    k.onyomi_readings = data[:onyomi_readings]
    k.meanings = data[:meanings]
  end

  CourseKanji.find_or_create_by!(course: n1, kanji: kanji) do |ck|
    ck.is_published = true
  end

  kanji
end

# N1 Grammar
n1_grammars = [
  { title: "をもって", slug: "をもって-womotte", meanings: ["with", "by means of", "as of"] },
  { title: "に至っては", slug: "に至っては-niitatte", meanings: ["as for", "when it comes to"] }
].map do |data|
  grammar = Grammar.find_or_create_by!(slug: data[:slug]) do |g|
    g.title = data[:title]
    g.meanings = data[:meanings]
  end

  CourseGrammar.find_or_create_by!(course: n1, grammar: grammar) do |cg|
    cg.is_published = true
  end

  grammar
end

# N1 Vocabulary
n1_vocabularies = [
  { title: "措置", slug: "措置-sochi", kana: "そち", meanings: ["measure", "step"], types: ["noun", "suru_verb"] },
  { title: "見解", slug: "見解-kenkai", kana: "けんかい", meanings: ["opinion", "point of view"], types: ["noun"] }
].map do |data|
  vocabulary = Vocabulary.find_or_create_by!(slug: data[:slug]) do |v|
    v.title = data[:title]
    v.kana = data[:kana]
    v.meanings = data[:meanings]
    v.types = data[:types]
  end

  CourseVocabulary.find_or_create_by!(course: n1, vocabulary: vocabulary) do |cv|
    cv.is_published = true
  end

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

    # Create some kanji reviews
    course.course_kanjis.each do |course_kanji|
      next if rand > 0.7 # 70% chance to create a review

      UserReview.find_or_create_by!(
        user_course: user_course,
        course_point: course_kanji
      ) do |review|
        review.memorization_status = rand(0..6)
        review.number_of_total_reviews = rand(1..10)
        review.number_of_correct_reviews = rand(0..review.number_of_total_reviews)
        review.next_review_at = Time.current + rand(1..7).days
      end
    end

    # Create some grammar reviews
    course.course_grammars.each do |course_grammar|
      next if rand > 0.7 # 70% chance to create a review

      UserReview.find_or_create_by!(
        user_course: user_course,
        course_point: course_grammar
      ) do |review|
        review.memorization_status = rand(0..6)
        review.number_of_total_reviews = rand(1..10)
        review.number_of_correct_reviews = rand(0..review.number_of_total_reviews)
        review.next_review_at = Time.current + rand(1..7).days
      end
    end

    # Create some vocabulary reviews
    course.course_vocabularies.each do |course_vocabulary|
      next if rand > 0.7 # 70% chance to create a review

      UserReview.find_or_create_by!(
        user_course: user_course,
        course_point: course_vocabulary
      ) do |review|
        review.memorization_status = rand(0..6)
        review.number_of_total_reviews = rand(1..10)
        review.number_of_correct_reviews = rand(0..review.number_of_total_reviews)
        review.next_review_at = Time.current + rand(1..7).days
      end
    end
  end
end

# Load all seed files from db/seeds directory
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end
