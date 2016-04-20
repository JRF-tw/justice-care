class Problem < ActiveRecord::Base
  has_many :votes
  has_many :users, -> { uniq }, through: :votes
  paginates_per 15

  scope :hot_order, -> {
    select("problems.*, (count(case when votes.created_at > '#{2.weeks.ago}' then 1 else null end) + problems.add) AS votes_count").
    joins('LEFT OUTER JOIN "votes" ON "votes"."problem_id" = "problems"."id"').group("problems.id").order("votes_count DESC")
  }

  scope :lastest_order, -> {
    order(created_at: :desc)
  }

  scope :votes_order, -> {
    joins('LEFT OUTER JOIN "votes" ON "votes"."problem_id" = "problems"."id"').group("problems.id").order("(count(votes.id) + problems.add) DESC")
  }

  def is_voted?(user)
    return users.include? user
  end

  def votes_count
    votes.count + add
  end

end
