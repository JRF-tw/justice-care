class AddNumberToAnalyses < ActiveRecord::Migration
  def change
    add_column :analyses, :no, :integer, default: 0
  end
end
