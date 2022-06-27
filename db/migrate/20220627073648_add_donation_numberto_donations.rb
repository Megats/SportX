class AddDonationNumbertoDonations < ActiveRecord::Migration[7.0]
  def change
    add_column :donations, :donation_number, :string
  end
end
