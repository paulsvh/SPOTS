class User < ApplicationRecord
    has_many :spots, foreign_key: :creator_id
    has_many :reviews
    has_many :reviewed_spots, through: :reviews, source: :spot

    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true
    has_secure_password
    
end
