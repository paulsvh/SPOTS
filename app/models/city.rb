class City < ApplicationRecord
    has_many :spots
    validates :name, presence: true
    validates :country, presence: true

end
