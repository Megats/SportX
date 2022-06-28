class AddShirtSizeToParticipant < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :shirt_size, :string
  end
end
