class Review < ApplicationRecord
    belongs_to :user
    belongs_to :spot
    validates :title, presense: true
    validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 11}
    validates :spot, uniqueness: {scope: :user, message: "You've already reviewed this spot!"}

    
end
