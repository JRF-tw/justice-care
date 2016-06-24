class Report < ActiveRecord::Base
  belongs_to :analysis
  default_scope { order(no: :asc).order(id: :asc) }
end
