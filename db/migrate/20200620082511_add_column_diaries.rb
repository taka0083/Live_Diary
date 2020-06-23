class AddColumnDiaries < ActiveRecord::Migration[5.2]
  def change
  	add_column :diaries, :setlist, :text
  end
end
