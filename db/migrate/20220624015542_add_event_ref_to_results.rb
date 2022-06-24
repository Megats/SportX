class AddEventRefToResults < ActiveRecord::Migration[7.0]
  def change
    add_reference :results, :event, null: false, foreign_key: true
    add_reference :results, :user, null: false, foreign_key: true
  end
end
