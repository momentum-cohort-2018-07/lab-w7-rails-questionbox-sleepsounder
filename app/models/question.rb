class Question < ApplicationRecord
    include PgSearch
      multisearchable :against => [:title, :body]
      pg_search_scope :search_title, against: [:title]
      pg_search_scope :search_all_variants,
        against: [:title, :body],
        using: {
          tsearch: { dictionary: 'english' } # This searches all word variants
        }

    paginates_per 5
    belongs_to :user
    has_many :answers, as: :answerable, dependent: :destroy
    validates :title, :body, :user_id, presence: true
end
