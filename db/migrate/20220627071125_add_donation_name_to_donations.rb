class AddDonationNameToDonations < ActiveRecord::Migration[7.0]
  def change
    add_column :donations, :donation_name, :string
  end
end
