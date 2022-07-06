class AddParticipantFeesToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :participant_fees, :decimal
  end
end
