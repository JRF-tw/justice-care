class AddTotal520VotesCacheToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :total_520_votes_cache, :integer, default: 0
  end
end
