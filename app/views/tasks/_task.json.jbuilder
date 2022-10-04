json.extract! task, :id, :title, :description, :user_id, :list_id, :priority, :soft_deleted, :created_at, :updated_at
json.url task_url(task, format: :json)
