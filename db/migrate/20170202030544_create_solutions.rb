class CreateSolutions < ActiveRecord::Migration[4.2]
  def change
    create_table :solutions do |t|
      t.string :title
      t.integer :no, default: 0
      t.string :discourse_url
      t.text :content

      t.timestamps null: false
    end
  end
end
