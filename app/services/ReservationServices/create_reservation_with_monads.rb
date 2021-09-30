# frozen_string_literal: true

require 'dry/monads'

module ReservationServices
  class CreateReservationWithMonads
    include Dry::Monads[:result, :do]

    def call(params)
      reservation = yield save_reservation(params)

      Success(reservation)
    end

    private

    def save_reservation(params)
      reservation = Reservation.new(params)
      if reservation.save
        Success(reservation)
      else
        Failure(reservation.errors.full_messages)
      end
    end
  end
end
