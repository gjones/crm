json.extract! task, :id, :title, :detail, :author, :contact_id, :completed, :created_at, :updated_at
json.url task_url(task, format: :json)