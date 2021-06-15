json.extract! blog_app, :id, :title, :body, :author, :created_at, :updated_at
json.url blog_app_url(blog_app, format: :json)
