class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :participant_email
      t.string :participant_nationality
      t.string :participant_COR
      t.string :paticipant_NRIC
      t.date :participants_dob
      t.string :participant_category

      t.timestamps
    end
  end
end
