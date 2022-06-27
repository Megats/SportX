class AddParticipantStatusToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :participant_status, :string, :default => "Registered"
  end
end
