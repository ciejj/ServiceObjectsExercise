module ReservationServices
  class AddProduct
    def call(params)
      save_reservation(params)
    end

    private

    def save_reservation(params)
      reservation = Reservation.new(params)
      if reservation.save
        OpenStruct.new(success?: true, payload: reservation)
      else
        OpenStruct.new(success?: false, payload: reservation.errors)
      end
    end
  end
end