class AddReceiptToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :data, :jsonb
  end
end
