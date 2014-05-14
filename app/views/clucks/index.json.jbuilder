json.array!(@clucks) do |cluck|
  json.extract! cluck, :userid, :username, :body, :posted_date :starred
  json.url cluck_url(cluck, format: :json)
end