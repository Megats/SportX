json.extract! category, :id, :category_name, :category_gender, :category_age, :event_id, :category_fees, :created_at, :updated_at
json.url admin_categories_path(category, format: :json)
