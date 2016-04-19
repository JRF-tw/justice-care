class Problem < ActiveRecord::Base
  has_many :votes
  has_many :users, -> { uniq }, through: :votes

  def is_voted?(user)
    return users.include? user
  end
end
