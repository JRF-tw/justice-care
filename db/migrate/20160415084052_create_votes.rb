class CreateVotes < ActiveRecord::Migration[4.2]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :problem_id

      t.timestamps null: false
    end
  end
end
