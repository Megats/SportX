json.extract! collab, :id, :collab_name, :collab_organiser, :collab_contact, :collab_email, :collab_website, :created_at, :updated_at
json.url collab_url(collab, format: :json)
