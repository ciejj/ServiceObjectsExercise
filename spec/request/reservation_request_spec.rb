require 'rails_helper'

RSpec.describe '/api/v1/reservations', :type => :request do
  describe 'POST /api/v1/reservations' do
    subject(:request_call) do
        post '/api/v1/reservations', params: {
            reservation: {
              start_time: DateTime.now,
              customer_id: customer.id,
              table_id: table.id,
              number_of_people: number_of_people
              }
        }
    end

    let(:customer) { create(:customer) }
    let(:table) { create(:table, seats: 4) }

    context 'when reservation params are valid' do
      let(:reservation_date) { DateTime.now + 10.days }
      let(:number_of_people) { 2 }
      
      before do
          request_call
      end

      it 'returns code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the reservation date is invalid' do
      let(:reservation_date) { DateTime.now }
      let(:number_of_people) { 2 }

      before do
        request_call
      end

      it 'returns code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        expect(response.body).to eq("{\"error\":\"Reservation date is invalid - it has to be at least 7 days from now.\"}") 
      end
    end

    context 'when the number of people is greater than seats at the table' do
        let(:reservation_date) { DateTime.now + 10.days }
        let(:number_of_people) { 5 }
  
        before do
          request_call
        end
  
        it 'returns code 422' do
          expect(response).to have_http_status(422)
        end
  
        it 'returns error message' do
          expect(response.body).to eq("{\"error\":\"Incorrect table selected - not enough seats.\"}") 
        end
      end
  end
end
