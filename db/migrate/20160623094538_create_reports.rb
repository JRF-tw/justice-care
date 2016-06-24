class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :analysis_id
      t.string :title
      t.integer :no, default: 0
      t.string :discourse_url
      t.string :mindmap_url
      t.text :content

      t.timestamps null: false
    end
  end
end
