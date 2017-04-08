json.extract! employee, :id, :name, :identification, :area_id, :admission_date, :active, :position, :company_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
