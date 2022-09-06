class PeopleWantInformation < ActiveRecord::Migration[5.1]
  def up
    add_column :people, :include_in_mailings, :boolean, null: false, default: false
  end

  def down
    remove_column :people, :include_in_mailings
  end
end
