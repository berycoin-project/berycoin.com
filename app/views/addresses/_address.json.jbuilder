json.extract! address, :id, :street, :country, :city, :zip, :created_at, :updated_at
json.url address_url(address, format: :json)
