class AddUserShotToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :user_shot, :string
  end
end
