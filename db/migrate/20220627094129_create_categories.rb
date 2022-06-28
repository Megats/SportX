class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.string :category_gender
      t.decimal :category_fees

      t.timestamps
    end
  end
end
