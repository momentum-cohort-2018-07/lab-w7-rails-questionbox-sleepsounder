class Question < ApplicationRecord
    paginates_per 5
    belongs_to :user
    has_many :answers, as: :answerable, dependent: :destroy
    validates :title, :body, :user_id, presence: true
end
