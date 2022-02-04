json.extract! post, :id, :title, :content, :published_at, :modified_at, :published, :created_at, :updated_at
json.url post_url(post, format: :json)
