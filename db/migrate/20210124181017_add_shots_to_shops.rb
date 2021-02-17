class AddShotsToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :shots, :string
  end
end
