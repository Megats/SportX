class AddParticipantAddressToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :participant_postal, :string
    add_column :participants, :participant_city, :string
    add_column :participants, :participant_state, :string
  end
end
