class Spot < ApplicationRecord
    belongs_to :city
    has_many :reviews
    has_many :users, through: :reviews
    belongs_to :user
    has_one_attached :image
    validates :name, presence: true
    validates :location, presence: true

end
