class RestructureCoursePoints < ActiveRecord::Migration[8.0]
  def change
    # Rename tables
    rename_table :course_kanjis, :course_level_kanjis
    rename_table :course_vocabularies, :course_level_vocabularies
    rename_table :course_grammars, :course_level_grammars

    # Remove course_id and add course_level_id to kanjis
    remove_reference :course_level_kanjis, :course
    add_reference :course_level_kanjis, :course_level, null: false, foreign_key: true
    add_index :course_level_kanjis, [:course_level_id, :kanji_id], unique: true, name: 'index_course_level_kanjis_unique'

    # Remove course_id and add course_level_id to vocabularies
    remove_reference :course_level_vocabularies, :course
    add_reference :course_level_vocabularies, :course_level, null: false, foreign_key: true
    add_index :course_level_vocabularies, [:course_level_id, :vocabulary_id], unique: true, name: 'index_course_level_vocabularies_unique'

    # Remove course_id and add course_level_id to grammars
    remove_reference :course_level_grammars, :course
    add_reference :course_level_grammars, :course_level, null: false, foreign_key: true
    add_index :course_level_grammars, [:course_level_id, :grammar_id], unique: true, name: 'index_course_level_grammars_unique'
  end
end