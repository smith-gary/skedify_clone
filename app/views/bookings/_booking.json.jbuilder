json.extract! booking, :id, :availability_id, :client_email, :status, :created_at, :updated_at
json.url booking_url(booking, format: :json)
