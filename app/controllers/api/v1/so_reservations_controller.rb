# frozen_string_literal: true

module Api
  module V1
    class SoReservationsController < ApplicationController
      def create
        result = ReservationServices::CreateReservation.new.call(reservation_params)

        if result.success?
          render json: result.payload, status: :created
        else
          render json: { errors: result.payload[:errors] }, status: :unprocessable_entity
        end
      end

      private

      def reservation_params
        params.require(:reservation).permit(:start_time, :number_of_people, :table_id, :customer_id)
      end
    end
  end
end
