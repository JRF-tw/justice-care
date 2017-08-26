class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :problem
  validates_uniqueness_of :problem_id, scope: :user_id
  after_create :plus_votes_cache
  before_destroy :minus_votes_cache

  def plus_votes_cache
    problem.with_lock do
      problem.total_votes_cache += 1
      problem.recently_votes_cache += 1
      problem.save!
    end
  end

  def minus_votes_cache
    problem.with_lock do
      problem.total_votes_cache -= 1
      problem.recently_votes_cache -= 1
      problem.save!
    end
  end
end
