class Solution < ActiveRecord::Base
  has_and_belongs_to_many :problems, -> { uniq }
  default_scope { order(no: :asc).order(id: :asc) }
end
