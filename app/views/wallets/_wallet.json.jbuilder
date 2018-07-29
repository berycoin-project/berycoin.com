json.extract! wallet, :id, :label, :address, :balance, :created_at, :updated_at
json.url wallet_url(wallet, format: :json)
