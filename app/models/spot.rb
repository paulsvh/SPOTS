class Spot < ApplicationRecord
    belongs_to :creator, class_name: :User, foreign_key: :creator_id
    belongs_to :city
    has_many :reviews
    has_many :users, through: :reviews
    has_one_attached :image
    validates :not_a_duplicate
    validates :name, presence: true
    validates :location, presence: true

end
