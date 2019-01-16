json.extract! bug, :id, :bug_title, :bug_description, :bug_deadline, :bug_type, :bug_status, :add_id, :assign_id, :project_id, :created_at, :updated_at
json.url bug_url(bug, format: :json)
