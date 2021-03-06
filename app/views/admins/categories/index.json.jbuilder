json.set! :data do
  json.array! @categories do |category|
    json.partial! 'admins/categories/category', category: category
    json.url  "
              #{link_to 'Show', category }
              #{link_to 'Edit', edit_category_path(category)}
              #{link_to 'Destroy', category, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end