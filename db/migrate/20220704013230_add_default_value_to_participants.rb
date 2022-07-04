class AddDefaultValueToParticipants < ActiveRecord::Migration[7.0]
  def change
    change_column_default :participants, :participant_status, from: "Registered", to: "pending"
  end
end
