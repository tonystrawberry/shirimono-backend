# db/seeds/course.rb
Course.find_or_create_by!(slug: 'n5') { |c| c.title = 'JLPT N5'; c.kanjis_count = 0; c.vocabularies_count = 0; c.grammars_count = 0 }
Course.find_or_create_by!(slug: 'n4') { |c| c.title = 'JLPT N4'; c.kanjis_count = 0; c.vocabularies_count = 0; c.grammars_count = 0 }
Course.find_or_create_by!(slug: 'n3') { |c| c.title = 'JLPT N3'; c.kanjis_count = 0; c.vocabularies_count = 0; c.grammars_count = 0 }
Course.find_or_create_by!(slug: 'n2') { |c| c.title = 'JLPT N2'; c.kanjis_count = 0; c.vocabularies_count = 0; c.grammars_count = 0 }
Course.find_or_create_by!(slug: 'n1') { |c| c.title = 'JLPT N1'; c.kanjis_count = 0; c.vocabularies_count = 0; c.grammars_count = 0 }