class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :attendable_events, :event_id, :attended_event_id
  end
end
