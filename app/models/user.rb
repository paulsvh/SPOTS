class User < ApplicationRecord
    has_many :reviews
    has_many :spots, through: :revies

    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true
    has_secure_password
    
end
