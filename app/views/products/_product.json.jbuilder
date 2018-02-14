json.extract! product, :id, :name, :product_type_id, :provider_id, :quantity, :value, :created_at, :updated_at
json.url product_url(product, format: :json)
