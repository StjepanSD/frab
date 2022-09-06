class RemovePentabarfColumnsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :pentabarf_salt
    remove_column :users, :pentabarf_password
  end
end
