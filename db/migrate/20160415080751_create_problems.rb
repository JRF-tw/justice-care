class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.text :content
      t.string :link
      t.integer :add, default: 0, null: false

      t.timestamps null: false
    end
  end
end
