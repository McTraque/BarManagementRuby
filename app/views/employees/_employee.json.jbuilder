json.extract! employee, :id, :first_name, :last_name, :email, :phone_number, :adress, :id_card, :role, :status, :created_at, :updated_at
json.url employee_url(employee, format: :json)
