class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :donation_email
      t.string :donation_nationality
      t.string :donation_COR
      t.string :donation_NRIC
      t.date :donation_dob
      t.integer :donation_amount

      t.timestamps
    end
  end
end
