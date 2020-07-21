class Creator < ApplicationRecord
    has_many :spots
    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true
    has_secure_password
end
