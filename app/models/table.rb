# frozen_string_literal: true

class Table < ApplicationRecord
  has_many :reservations

  validates :number, presence: true
  validates :seats, presence: true
end
