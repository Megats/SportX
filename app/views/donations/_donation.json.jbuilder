json.extract! donation, :id, :user_id, :donation_email, :donation_nationality, :donation_COR, :donation_NRIC, :donation_dob, :donation_amount, :created_at, :updated_at
json.url donation_url(donation, format: :json)
