class AddColumnsToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :attendee_id, :integer
    add_column :invitations, :attended_event_id, :integer
  end
end
