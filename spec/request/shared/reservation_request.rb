# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'reservation request', type: :request do
  subject(:request_call) do
    post "/api/v1/#{path}", params: {
      reservation: {
        start_time: DateTime.now,
        customer_id: customer.id,
        table_id: table.id,
        number_of_people: number_of_people
      }
    }
  end

  let(:customer) { create(:customer) }
  let(:table) { create(:table, seats: 2) }

  context 'when reservation params are valid' do
    let(:reservation_date) { (Reservation::MINIMUN_OFFSET + 1.day).from_now }
    let(:number_of_people) { table.seats - 1 }

    before do
      request_call
    end

    it 'returns code 201' do
      expect(response).to have_http_status(:created)
    end
  end

  context 'when the cusomer is invalid' do
    let(:reservation_date) { (Reservation::MINIMUN_OFFSET + 1.day).from_now }
    let(:number_of_people) { table.seats - 1 }

    before do
      customer.id = 0
      request_call
    end

    it 'returns code 422' do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error message' do
      expect(response.body).to eq('{"errors":["Customer must exist"]}')
    end
  end

  context 'when the table is invalid' do
    let(:reservation_date) { (Reservation::MINIMUN_OFFSET + 1.day).from_now }
    let(:number_of_people) { table.seats - 1 }

    before do
      table.id = 0
      request_call
    end

    it 'returns code 422' do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error message' do
      expect(response.body).to eq('{"errors":["Table must exist"]}')
    end
  end

  context 'when the reservation date is invalid' do
    let(:reservation_date) { DateTime.now }
    let(:number_of_people) { table.seats - 1 }

    before do
      request_call
    end

    it 'returns code 422' do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error message' do
      expect(response.body).to eq('{"errors":["Reservation date must be at least 7 days from now"]}')
    end
  end

  context 'when the number of people is greater than seats at the table' do
    let(:reservation_date) { (Reservation::MINIMUN_OFFSET + 1.day).from_now }
    let(:number_of_people) { table.seats + 1 }

    before do
      request_call
    end

    it 'returns code 422' do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error message' do
      expect(response.body).to eq('{"errors":["Selected Table does not have enough seats"]}')
    end
  end
end
