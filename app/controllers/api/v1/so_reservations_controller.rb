module Api
  module V1
    class SoReservationsController < ApplicationController

      def create
        create_reservation = ReservationServices::CreateReservation.new.call(reservation_params)

        if create_reservation.success?
          render json: create_reservation.payload, status: 201
        else
          render error: create_reservation.payload[:error], status: 422
        end
      end
      
      private

      def reservation_params
        params.require(:reservation).permit(:start_time, :number_of_people, :table_id, :customer_id)
      end
    end
  end
end


