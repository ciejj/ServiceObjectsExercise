module Api
  module V1
    class MonadsReservationsController < ApplicationController

      def create
        result = ReservationServices::CreateReservationWithMonads.new.call(reservation_params)

        if result.success?
          render json: result.value!, status: 201
        else
          render json: { :errors => result.failure } , status: 422
        end
      end
      
      private

      def reservation_params
        params.require(:reservation).permit(:start_time, :number_of_people, :table_id, :customer_id)
      end
    end
  end
end


