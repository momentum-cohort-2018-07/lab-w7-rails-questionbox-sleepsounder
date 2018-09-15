class Question < ApplicationRecord
    paginates_per 5
    belongs_to :user
    has_many :answers
    validates :title, :body, :user_id, presence: true
end
