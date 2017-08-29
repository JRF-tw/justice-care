class AddStepToProblems < ActiveRecord::Migration[4.2]
  def change
    add_column :problems, :status, :string, default: 'step1'
    rename_column :problems, :link, :discourse_url 
  end
end
