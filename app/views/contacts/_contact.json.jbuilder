json.extract! contact, :id, :name, :birth_date, :phone, :address, :cc, :cc_franchise, :email, :user_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
