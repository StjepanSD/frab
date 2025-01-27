class AddSpeakerCounter < ActiveRecord::Migration[5.1]
  def up
    add_column :events, :speaker_count, :integer, default: 0

    Event.reset_column_information
    Event.all.each do |event|
      c = EventPerson.where(event_id: event.id, event_role: :speaker).count
      event.update_attribute :speaker_count, c
    end
  end

  def down
    remove_column :events, :speaker_count
  end
end
