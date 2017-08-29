class CreateAnalysesProblems < ActiveRecord::Migration[4.2]
  def change
    create_table :analyses_problems do |t|
      t.references :analysis, null: false
      t.references :problem, null: false
    end
    add_index(:analyses_problems, [:analysis_id, :problem_id], unique: true)
  end
end
