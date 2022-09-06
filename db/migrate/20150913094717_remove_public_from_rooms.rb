class RemovePublicFromRooms < ActiveRecord::Migration[5.1]
  def up
    remove_column :rooms, :public
  end
  def down
    add_column :rooms, :public, :boolean, default: true
  end
end
