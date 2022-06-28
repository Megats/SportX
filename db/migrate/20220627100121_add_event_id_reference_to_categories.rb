class AddEventIdReferenceToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :event, null: false, foreign_key: true
  end
end
