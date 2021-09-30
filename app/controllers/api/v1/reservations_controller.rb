module Api
  module V1
    class ReservationsController < ApplicationController

      def create
        reservation =  Reservation.new(reservation_params)
        if reservation.save
          render json: reservation, status: 201
        else
          render error: reservation.errors, status: 422
        end
      end
      
      private

      def reservation_params
        params.require(:reservation).permit(:start_time, :number_of_people, :table_id, :customer_id)
      end
    end
  end
end


