class AddEventPriceToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :event_price, :integer
  end
end
