class Review < ApplicationRecord
    belongs_to :user
    belongs_to :spot
    validates :title, presence: true
    validates :content, presence: true
    
end
