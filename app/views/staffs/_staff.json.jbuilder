json.extract! staff, :id, :name, :email, :base_salary, :monthly_bonus, :department, :role, :password_digest, :created_at, :updated_at
json.url staff_url(staff, format: :json)
