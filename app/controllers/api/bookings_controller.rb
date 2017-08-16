class Api::BookingsController < ApplicationController
  def index
    bookings = Booking.all
    render json: bookings, status: 200
  end

  def create
    booking = Booking.new(booking_params)
    if booking.save
      render json: booking, status: 201
    else
      render json: booking.errors, status: :unprocessable_entity 
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:timeslot_id, :size)
  end
end
