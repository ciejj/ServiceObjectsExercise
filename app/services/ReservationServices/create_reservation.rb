module ReservationServices
  class CreateReservation
    def call(params)
      save_reservation(params)
    end

    private

    def save_reservation(params)
      reservation = Reservation.new(params)
      if reservation.save
        OpenStruct.new(success?: true, payload: reservation)
      else
        OpenStruct.new(success?: false, payload: { errors: reservation.errors.full_messages })
      end
    end
  end
end