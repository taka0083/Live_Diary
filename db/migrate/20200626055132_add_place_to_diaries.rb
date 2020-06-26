class AddPlaceToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :place, :string
  end
end
