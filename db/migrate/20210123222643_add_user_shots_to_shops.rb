class AddUserShotsToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :user_shots, :string
  end
end
