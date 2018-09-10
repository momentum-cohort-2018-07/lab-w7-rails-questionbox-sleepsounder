class User < ApplicationRecord
  has_many :questions
  has_many :answers
  has_secure_token :api_token
  has_secure_password
end
