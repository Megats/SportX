class AddCategoryAgeToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :category_age, :string
  end
end
