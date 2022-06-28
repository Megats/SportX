class AddOverviewToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :event_overview, :text
  end
end
