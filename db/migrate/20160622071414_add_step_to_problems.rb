class AddStepToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :status, :string, default: 'step1'
    rename_column :problems, :link, :discourse_url 
  end
end
