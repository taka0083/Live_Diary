class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.integer :user_id
      t.string :live_image_id
      t.string :artist_name
      t.string :live_name
      t.string :title
      t.text :impression
      t.date :date

      t.timestamps
    end
  end
end
