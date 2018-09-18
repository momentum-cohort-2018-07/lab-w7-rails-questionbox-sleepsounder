json.array! @users do |user|
  json.extract! user, :id, :username, :email, :created_at
end