class User < ApplicationRecord
  has_many :questions
  has_many :answers, as: :answerable
  has_secure_token :api_token
  has_secure_password
end
