class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_venue
      t.date :event_date
      t.time :event_time

      t.timestamps
    end
  end
end
