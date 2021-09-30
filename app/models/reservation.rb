# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :table

  MINIMUN_OFFSET = 7.days
end
