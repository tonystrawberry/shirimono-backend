class CreateUserCourseLevelGrammarLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :user_course_level_grammar_links do |t|
      t.references :user_course_level_grammar, null: false, foreign_key: true, comment: "UserCourseLevelGrammar that the grammar belongs to"
      t.references :course_level_grammar_link, null: false, foreign_key: true, comment: "CourseLevelGrammar that the grammar belongs to"

      t.integer :status, null: false, default: 0, comment: "Status of the user course level grammar (e.g. not_started, partially_in_progress, all_in_progress, completed)"
      t.integer :user_review_grammars_count, null: false, default: 0, comment: "Number of user reviews for the user course level grammar"

      t.timestamps
    end

    add_index :user_course_level_grammar_links, [:user_course_level_grammar_id, :course_level_grammar_link_id], unique: true, name: "index_user_course_level_grammar_links_unique"
  end
end
