class AddMoreSettingsToConference < ActiveRecord::Migration[5.1]
  def change
    add_column :conferences, :expenses_enabled, :boolean, default: false, null: false
    add_column :conferences, :transport_needs_enabled, :boolean, default: false, null: false
  end
end
