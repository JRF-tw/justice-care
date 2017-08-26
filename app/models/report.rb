class Report < ApplicationRecord
  belongs_to :analysis
  default_scope { order(no: :asc).order(id: :asc) }
end
