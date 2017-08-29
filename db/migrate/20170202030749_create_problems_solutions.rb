class CreateProblemsSolutions < ActiveRecord::Migration[4.2]
  def change
    create_table :problems_solutions do |t|
      t.references :problem, null: false
      t.references :solution, null: false
    end
    add_index(:problems_solutions, [:problem_id, :solution_id], unique: true)
  end
end
