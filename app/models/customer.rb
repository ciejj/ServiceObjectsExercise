class Customer < ApplicationRecord
    has_many :reservations

    validates :name, presence: true
    validates :email, presence: true
end
