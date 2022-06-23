class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :nameevent
      t.string :venueevent
      t.string :dateevent
      t.string :timeevent

      t.timestamps
    end
  end
end
