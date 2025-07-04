# db/seeds/grammar.rb
Grammar.find_or_create_by!(slug: 'wa', title: 'は', meanings: ['Topic marker'])
Grammar.find_or_create_by!(slug: 'ga', title: 'が', meanings: ['Subject marker'])
Grammar.find_or_create_by!(slug: 'wo', title: 'を', meanings: ['Object marker'])
Grammar.find_or_create_by!(slug: 'ni', title: 'に', meanings: ['Direction/time marker'])
Grammar.find_or_create_by!(slug: 'de', title: 'で', meanings: ['Location marker'])
Grammar.find_or_create_by!(slug: 'no', title: 'の', meanings: ['Possessive marker'])
Grammar.find_or_create_by!(slug: 'to', title: 'と', meanings: ['And/with'])
Grammar.find_or_create_by!(slug: 'mo', title: 'も', meanings: ['Also/too'])
Grammar.find_or_create_by!(slug: 'kara', title: 'から', meanings: ['From/since'])
Grammar.find_or_create_by!(slug: 'made', title: 'まで', meanings: ['Until/up to'])
Grammar.find_or_create_by!(slug: 'yori', title: 'より', meanings: ['Than (comparison)'])
Grammar.find_or_create_by!(slug: 'dake', title: 'だけ', meanings: ['Only/just'])
Grammar.find_or_create_by!(slug: 'shika', title: 'しか', meanings: ['Only (with negative)'])
Grammar.find_or_create_by!(slug: 'demo', title: 'でも', meanings: ['But/however'])
Grammar.find_or_create_by!(slug: 'node', title: 'ので', meanings: ['Because (reason)'])
Grammar.find_or_create_by!(slug: 'kara2', title: 'から', meanings: ['Because (reason)'])
Grammar.find_or_create_by!(slug: 'kedo', title: 'けど', meanings: ['But/although'])
Grammar.find_or_create_by!(slug: 'nagara', title: 'ながら', meanings: ['While doing'])
Grammar.find_or_create_by!(slug: 'tari', title: 'たり', meanings: ['Listing actions'])
Grammar.find_or_create_by!(slug: 'tari-tari', title: 'たり...たり', meanings: ['Doing things like...'])
Grammar.find_or_create_by!(slug: 'sou', title: 'そう', meanings: ['Looks like/seems'])
Grammar.find_or_create_by!(slug: 'you', title: 'よう', meanings: ['Like/as if'])
Grammar.find_or_create_by!(slug: 'mitai', title: 'みたい', meanings: ['Like/similar to'])
Grammar.find_or_create_by!(slug: 'koto', title: 'こと', meanings: ['Nominalizer'])
Grammar.find_or_create_by!(slug: 'noni', title: 'のに', meanings: ['Despite/although'])
Grammar.find_or_create_by!(slug: 'tame', title: 'ため', meanings: ['For/because of'])
Grammar.find_or_create_by!(slug: 'tsumori', title: 'つもり', meanings: ['Intend to'])
Grammar.find_or_create_by!(slug: 'hazu', title: 'はず', meanings: ['Should/expected to'])
Grammar.find_or_create_by!(slug: 'beki', title: 'べき', meanings: ['Should/ought to'])
Grammar.find_or_create_by!(slug: 'kotogadekiru', title: 'ことができる', meanings: ['Can do'])
Grammar.find_or_create_by!(slug: 'kotoninaru', title: 'ことになる', meanings: ['It has been decided that'])
Grammar.find_or_create_by!(slug: 'kotonisuru', title: 'ことにする', meanings: ['Decide to'])
Grammar.find_or_create_by!(slug: 'teiru', title: 'ている', meanings: ['Ongoing action'])
Grammar.find_or_create_by!(slug: 'tearu', title: 'てある', meanings: ['Resulting state'])
Grammar.find_or_create_by!(slug: 'temiru', title: 'てみる', meanings: ['Try doing'])
Grammar.find_or_create_by!(slug: 'teshimau', title: 'てしまう', meanings: ['Finish doing'])
Grammar.find_or_create_by!(slug: 'teoku', title: 'ておく', meanings: ['Do in advance'])
Grammar.find_or_create_by!(slug: 'temoii', title: 'てもいい', meanings: ['May/is allowed'])
Grammar.find_or_create_by!(slug: 'tewaikenai', title: 'てはいけない', meanings: ['Must not'])
Grammar.find_or_create_by!(slug: 'nakutemoii', title: 'なくてもいい', meanings: ['Don\'t have to'])
Grammar.find_or_create_by!(slug: 'nakerebanaranai', title: 'なければならない', meanings: ['Must/have to'])
Grammar.find_or_create_by!(slug: 'nakutewaikenai', title: 'なくてはいけない', meanings: ['Must/have to'])
Grammar.find_or_create_by!(slug: 'deshou', title: 'でしょう', meanings: ['Probably'])
Grammar.find_or_create_by!(slug: 'kamoshirenai', title: 'かもしれない', meanings: ['Might/perhaps'])
Grammar.find_or_create_by!(slug: 'rashii', title: 'らしい', meanings: ['Apparently'])
Grammar.find_or_create_by!(slug: 'souda', title: 'そうだ', meanings: ['I heard that'])
Grammar.find_or_create_by!(slug: 'youda', title: 'ようだ', meanings: ['It seems that'])
Grammar.find_or_create_by!(slug: 'bakari', title: 'ばかり', meanings: ['Just did'])
Grammar.find_or_create_by!(slug: 'bakarida', title: 'ばかりだ', meanings: ['Keep doing'])
Grammar.find_or_create_by!(slug: 'bakarini', title: 'ばかりに', meanings: ['Just because'])
Grammar.find_or_create_by!(slug: 'tekuru', title: 'てくる', meanings: ['To come to do (change or movement toward speaker)'])
