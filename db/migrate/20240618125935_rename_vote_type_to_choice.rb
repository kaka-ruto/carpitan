class RenameVoteTypeToChoice < ActiveRecord::Migration[7.1]
  def change
    rename_column :votes, :type, :choice
  end
end
