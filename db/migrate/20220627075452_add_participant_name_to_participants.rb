class AddParticipantNameToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :participant_name, :string
    add_column :participants, :participant_phone, :string
  end
end
