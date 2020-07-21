class Spot < ApplicationRecord
    belongs_to :city
    has_many :reviews
    has_many :users, through: :reviews
    has_one_attached :image
    validates :not_a_duplicate
    validates :name, presence: true
    validates :location, presence: true

end
