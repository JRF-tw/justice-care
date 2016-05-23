class Problem < ActiveRecord::Base
  has_many :votes
  has_many :users, -> { uniq }, through: :votes
  paginates_per 15

  scope :hot_order, -> {
    # select("problems.*, (count(case when votes.created_at > '#{2.weeks.ago}' then 1 else null end) + problems.add) AS votes_count").
    # joins('LEFT OUTER JOIN "votes" ON "votes"."problem_id" = "problems"."id"').group("problems.id").order("votes_count DESC").order(id: :asc)
    order(recently_votes_cache: :desc).order(id: :asc)
  }

  scope :lastest_order, -> {
    order(created_at: :desc).order(id: :asc)
  }

  scope :votes_order, -> {
    # joins('LEFT OUTER JOIN "votes" ON "votes"."problem_id" = "problems"."id"').group("problems.id").order("(count(votes.id) + problems.add) DESC").order(id: :asc)
    order(total_votes_cache: :desc).order(id: :asc)
  }

  scope :votes_order_before_520, -> {
    where("created_at < ?", '2016-05-20'.to_datetime).order(total_520_votes_cache: desc).order(id: :asc)
  }

  def is_voted?(user)
    return users.include? user
  end

  def count_total_votes
    votes.count + add
  end

  def count_recently_votes
    votes.where("created_at > ?", 5.days.ago.midnight).count + add
  end

  def count_520_votes
    votes.where("created_at < ?", '2016-05-20'.to_datetime ).count + add
  end

  def sync_votes_count
    self.total_votes_cache = count_total_votes
    self.recently_votes_cache = count_recently_votes
    self.total_520_votes_cache = count_520_votes
    self.save!
  end
end
