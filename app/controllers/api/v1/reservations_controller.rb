# frozen_string_literal: true

module Api
  module V1
    class ReservationsController < ApplicationController
      def create
        reservation = Reservation.new(reservation_params)

        if reservation.save
          render json: reservation, status: :created
        else
          render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def reservation_params
        params.require(:reservation).permit(:start_time, :number_of_people, :table_id, :customer_id)
      end
    end
  end
end
