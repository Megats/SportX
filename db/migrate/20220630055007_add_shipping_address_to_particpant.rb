class AddShippingAddressToParticpant < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :shipping_attention, :string
    add_column :participants, :shipping_address, :string
    add_column :participants, :shipping_postal, :string
    add_column :participants, :shipping_city, :string
    add_column :participants, :shipping_state, :string
    add_column :participants, :shipping_country, :string
  end
end
