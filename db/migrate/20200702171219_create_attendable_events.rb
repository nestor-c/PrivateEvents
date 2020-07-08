class CreateAttendableEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :attendable_events do |t|
      t.integer :attendee_id
      t.integer :event_id

      t.timestamps
    end
  end
end
