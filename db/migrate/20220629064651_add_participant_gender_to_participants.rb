class AddParticipantGenderToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :participant_gender, :string
    rename_column :participants, :paticipant_NRIC, :participant_NRIC
  end
end
