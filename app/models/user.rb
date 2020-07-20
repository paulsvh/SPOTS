class User < ApplicationRecord
    has_many :spots
    has_many :reviews
    has_many :reviewed_spots, through: :reviews, source: :spot
    
end
