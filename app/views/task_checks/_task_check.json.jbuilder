json.extract! task_check, :id, :description, :complete, :created_at, :updated_at
json.url task_check_url(task_check, format: :json)
