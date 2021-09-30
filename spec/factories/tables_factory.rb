# frozen_string_literal: true

FactoryBot.define do
  factory :table do
    number { Faker::Number.within(range: 1..10) }
    seats { Faker::Number.within(range: 1..8) }
  end
end
