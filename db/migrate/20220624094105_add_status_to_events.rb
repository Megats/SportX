class AddStatusToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :event_status, :string
  end
end
