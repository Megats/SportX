class ChangeUserIdDonationNullTrue < ActiveRecord::Migration[7.0]
  def change
    change_column :donations, :user_id, :bigint, null: true
  end
end
