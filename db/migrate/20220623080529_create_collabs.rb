class CreateCollabs < ActiveRecord::Migration[7.0]
  def change
    create_table :collabs do |t|
      t.string :org_name
      t.string :overview
      t.integer :donation_fee

      t.timestamps
    end
  end
end
