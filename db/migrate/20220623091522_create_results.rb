class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.string :result_description
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end
end
