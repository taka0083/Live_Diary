class AddDiariesToTitles < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :latitude, :float
    add_column :diaries, :longitude, :float
  end
end
