class AddCategoryToCategoryId < ActiveRecord::Migration[7.0]
  def change
    remove_column :participants, :participant_category, :string
    add_reference :participants, :category, null: false, foreign_key: true
  end
end
