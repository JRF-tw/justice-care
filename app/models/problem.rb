class Problem < ActiveRecord::Base
  has_many :votes
  has_many :users, -> { uniq }, through: :votes
  paginates_per 15

  scope :hot_order, -> {
    joins('LEFT OUTER JOIN "votes" ON "votes"."problem_id" = "problems"."id"').group("problems.id").where("votes.created_at < ?", 2.weeks.ago).order("(count(votes.id) + problems.add) ASC")
  }

  scope :lastest_order, -> {
    order(published_at: :desc)
  }

  scope :votes_order, -> {
    joins('LEFT OUTER JOIN "votes" ON "votes"."problem_id" = "problems"."id"').group("problems.id").order("(count(votes.id) + problems.add) ASC")
  }

  def is_voted?(user)
    return users.include? user
  end

  def votes_count
    votes.count + add
  end

end
