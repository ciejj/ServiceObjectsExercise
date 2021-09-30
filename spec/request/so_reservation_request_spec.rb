require 'rails_helper'
require_relative 'shared/reservation_request'

RSpec.describe '/api/v1/so_reservations', :type => :request do
  describe 'POST /api/v1/so_reservations' do
    it_behaves_like 'reservation request' do
      let(:path) { 'so_reservations' }
    end
  end
end
