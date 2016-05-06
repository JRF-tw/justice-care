class AddVoteCacheToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :total_votes_cache, :integer, default: 0
    add_column :problems, :recently_votes_cache, :integer, default: 0
  end
end
