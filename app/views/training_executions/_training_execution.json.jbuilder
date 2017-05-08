json.extract! training_execution, :id, :category, :topic, :objective, :date, :hourly_intensity, :trainer, :internal, :area_id, :collaborator_id, :company_id, :planned_training_id, :planned, :created_at, :updated_at
json.url training_execution_url(training_execution, format: :json)
