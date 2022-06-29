class CreateOnboardPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :onboard, :integer, :default => 0
  end
end
