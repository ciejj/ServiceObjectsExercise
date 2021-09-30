# frozen_string_literal: true

require 'rails_helper'
require_relative 'shared/reservation_request'

RSpec.describe '/api/v1/monads_reservations', type: :request do
  describe 'POST /api/v1/monads_reservations' do
    it_behaves_like 'reservation request' do
      let(:path) { 'monads_reservations' }
    end
  end
end
