puts 'Creating example sentences...'

# Helper method to create an example sentence with its associations
def create_example_sentence(sentence:, sentence_html:, translation:, associations: {})
  example = ExampleSentence.find_or_create_by!(sentence: sentence) do |es|
    es.sentence_html = sentence_html
    es.translation = translation
  end

  # Create kanji associations
  associations[:kanji]&.each do |kanji_title|
    kanji = Kanji.find_by!(title: kanji_title)
    ExampleSentenceKanji.find_or_create_by!(example_sentence: example, kanji: kanji)
  end

  # Create vocabulary associations
  associations[:vocabulary]&.each do |vocab_slug|
    vocabulary = Vocabulary.find_by!(slug: vocab_slug)
    ExampleSentenceVocabulary.find_or_create_by!(example_sentence: example, vocabulary: vocabulary)
  end

  # Create grammar associations
  associations[:grammar]&.each do |grammar_slug|
    grammar = Grammar.find_by!(slug: grammar_slug)
    ExampleSentenceGrammar.find_or_create_by!(example_sentence: example, grammar: grammar)
  end

  example
end

# Examples for 日 (day, sun) kanji
create_example_sentence(
  sentence: '今日は晴れです。',
  sentence_html: '<ruby>今日<rt>きょう</rt></ruby>は<ruby>晴<rt>は</rt></ruby>れです。',
  translation: 'Today is sunny.',
  associations: { kanji: ['日'], grammar: ['です-desu'] }
)

create_example_sentence(
  sentence: '日曜日に公園に行きます。',
  sentence_html: '<ruby>日曜日<rt>にちようび</rt></ruby>に<ruby>公園<rt>こうえん</rt></ruby>に<ruby>行<rt>い</rt></ruby>きます。',
  translation: 'I will go to the park on Sunday.',
  associations: { kanji: ['日'], grammar: ['ます-masu'] }
)

create_example_sentence(
  sentence: '毎日日本語を勉強します。',
  sentence_html: '<ruby>毎日<rt>まいにち</rt></ruby><ruby>日本語<rt>にほんご</rt></ruby>を<ruby>勉強<rt>べんきょう</rt></ruby>します。',
  translation: 'I study Japanese every day.',
  associations: { kanji: ['日'], grammar: ['ます-masu'] }
)

create_example_sentence(
  sentence: '日記を書きます。',
  sentence_html: '<ruby>日記<rt>にっき</rt></ruby>を<ruby>書<rt>か</rt></ruby>きます。',
  translation: 'I write a diary.',
  associations: { kanji: ['日'], grammar: ['ます-masu'] }
)

create_example_sentence(
  sentence: '明日は日曜日です。',
  sentence_html: '<ruby>明日<rt>あした</rt></ruby>は<ruby>日曜日<rt>にちようび</rt></ruby>です。',
  translation: 'Tomorrow is Sunday.',
  associations: { kanji: ['日'], grammar: ['です-desu'] }
)

create_example_sentence(
  sentence: '日本に住んでいます。',
  sentence_html: '<ruby>日本<rt>にほん</rt></ruby>に<ruby>住<rt>す</rt></ruby>んでいます。',
  translation: 'I live in Japan.',
  associations: { kanji: ['日'], grammar: ['ます-masu'] }
)

# Examples for 本 (book) kanji
create_example_sentence(
  sentence: '本を読みます。',
  sentence_html: '<ruby>本<rt>ほん</rt></ruby>を<ruby>読<rt>よ</rt></ruby>みます。',
  translation: 'I read a book.',
  associations: { kanji: ['本'], grammar: ['ます-masu'] }
)

create_example_sentence(
  sentence: '日本語の本があります。',
  sentence_html: '<ruby>日本語<rt>にほんご</rt></ruby>の<ruby>本<rt>ほん</rt></ruby>があります。',
  translation: 'I have a Japanese book.',
  associations: { kanji: ['本', '日'], grammar: ['ます-masu'] }
)

create_example_sentence(
  sentence: '本屋で本を買います。',
  sentence_html: '<ruby>本屋<rt>ほんや</rt></ruby>で<ruby>本<rt>ほん</rt></ruby>を<ruby>買<rt>か</rt></ruby>います。',
  translation: 'I buy a book at the bookstore.',
  associations: { kanji: ['本'], grammar: ['ます-masu'] }
)

create_example_sentence(
  sentence: 'これは本当です。',
  sentence_html: 'これは<ruby>本当<rt>ほんとう</rt></ruby>です。',
  translation: 'This is true.',
  associations: { kanji: ['本'], grammar: ['です-desu'] }
)

create_example_sentence(
  sentence: '本を借ります。',
  sentence_html: '<ruby>本<rt>ほん</rt></ruby>を<ruby>借<rt>か</rt></ruby>ります。',
  translation: 'I borrow a book.',
  associations: { kanji: ['本'], grammar: ['ます-masu'] }
)

create_example_sentence(
  sentence: '本棚に本があります。',
  sentence_html: '<ruby>本棚<rt>ほんだな</rt></ruby>に<ruby>本<rt>ほん</rt></ruby>があります。',
  translation: 'There are books on the bookshelf.',
  associations: { kanji: ['本'], grammar: ['ます-masu'] }
)

# Examples for 私 (I/me) vocabulary
create_example_sentence(
  sentence: '私は学生です。',
  sentence_html: '<ruby>私<rt>わたし</rt></ruby>は<ruby>学生<rt>がくせい</rt></ruby>です。',
  translation: 'I am a student.',
  associations: { vocabulary: ['私-watashi', '学生-gakusei'], grammar: ['です-desu'] }
)

create_example_sentence(
  sentence: '私の本です。',
  sentence_html: '<ruby>私<rt>わたし</rt></ruby>の<ruby>本<rt>ほん</rt></ruby>です。',
  translation: 'This is my book.',
  associations: { vocabulary: ['私-watashi'], kanji: ['本'], grammar: ['です-desu'] }
)

create_example_sentence(
  sentence: '私は日本語を勉強します。',
  sentence_html: '<ruby>私<rt>わたし</rt></ruby>は<ruby>日本語<rt>にほんご</rt></ruby>を<ruby>勉強<rt>べんきょう</rt></ruby>します。',
  translation: 'I study Japanese.',
  associations: { vocabulary: ['私-watashi'], kanji: ['日', '本'], grammar: ['ます-masu'] }
)

create_example_sentence(
  sentence: '私から始めます。',
  sentence_html: '<ruby>私<rt>わたし</rt></ruby>から<ruby>始<rt>はじ</rt></ruby>めます。',
  translation: 'I will start first.',
  associations: { vocabulary: ['私-watashi'], grammar: ['ます-masu'] }
)

create_example_sentence(
  sentence: '私も行きます。',
  sentence_html: '<ruby>私<rt>わたし</rt></ruby>も<ruby>行<rt>い</rt></ruby>きます。',
  translation: 'I will go too.',
  associations: { vocabulary: ['私-watashi'], grammar: ['ます-masu'] }
)

create_example_sentence(
  sentence: '私と一緒に行きましょう。',
  sentence_html: '<ruby>私<rt>わたし</rt></ruby>と<ruby>一緒<rt>いっしょ</rt></ruby>に<ruby>行<rt>い</rt></ruby>きましょう。',
  translation: "Let's go together.",
  associations: { vocabulary: ['私-watashi'], grammar: ['ます-masu'] }
)

# Examples for です grammar
create_example_sentence(
  sentence: 'これは本です。',
  sentence_html: 'これは<ruby>本<rt>ほん</rt></ruby>です。',
  translation: 'This is a book.',
  associations: { grammar: ['です-desu'], kanji: ['本'] }
)

create_example_sentence(
  sentence: '先生です。',
  sentence_html: '<ruby>先生<rt>せんせい</rt></ruby>です。',
  translation: '(I) am a teacher.',
  associations: { grammar: ['です-desu'], vocabulary: ['先生-sensei'] }
)

create_example_sentence(
  sentence: '日本人です。',
  sentence_html: '<ruby>日本人<rt>にほんじん</rt></ruby>です。',
  translation: '(I) am Japanese.',
  associations: { grammar: ['です-desu'], kanji: ['日', '本'] }
)

create_example_sentence(
  sentence: '学校です。',
  sentence_html: '<ruby>学校<rt>がっこう</rt></ruby>です。',
  translation: 'This is a school.',
  associations: { grammar: ['です-desu'] }
)

create_example_sentence(
  sentence: '元気です。',
  sentence_html: '<ruby>元気<rt>げんき</rt></ruby>です。',
  translation: '(I) am fine.',
  associations: { grammar: ['です-desu'] }
)

create_example_sentence(
  sentence: '静かです。',
  sentence_html: '<ruby>静<rt>しず</rt></ruby>かです。',
  translation: 'It is quiet.',
  associations: { grammar: ['です-desu'] }
)

puts 'Example sentences and their associations created successfully!'