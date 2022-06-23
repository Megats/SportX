json.extract! collab, :id, :org_name, :overview, :donation_fee, :created_at, :updated_at
json.url collab_url(collab, format: :json)
