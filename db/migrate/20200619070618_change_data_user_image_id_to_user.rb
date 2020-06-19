class ChangeDataUserImageIdToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :user_image_id, :string
  end
end
