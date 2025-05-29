class RenameTypeToVocabularyPairType < ActiveRecord::Migration[8.0]
  def change
    rename_column :vocabulary_pairs, :type, :pair_type
  end
end
