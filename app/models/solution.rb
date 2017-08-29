class Solution < ApplicationRecord
  has_and_belongs_to_many :problems, index: { unique: true }
  default_scope { order(no: :asc).order(id: :asc) }
end
