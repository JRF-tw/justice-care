class AddNumberToAnalyses < ActiveRecord::Migration[4.2]
  def change
    add_column :analyses, :no, :integer, default: 0
  end
end
