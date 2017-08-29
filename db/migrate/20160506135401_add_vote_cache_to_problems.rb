class AddVoteCacheToProblems < ActiveRecord::Migration[4.2]
  def change
    add_column :problems, :total_votes_cache, :integer, default: 0
    add_column :problems, :recently_votes_cache, :integer, default: 0
  end
end
