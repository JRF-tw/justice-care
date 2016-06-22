class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
      t.string :title
      t.string :image
      t.text :content
      t.string :mindmap_url
      t.string :youtube_url
      t.string :youtube_id
      t.string :discourse_url
      t.timestamps null: false
    end
  end
end
