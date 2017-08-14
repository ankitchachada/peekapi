class Api::TimeslotsController < ApplicationController
	def index
		timeslots = Timeslot.all
		if params[:date]
			timeslots = timeslots.find_by_date(params[:date])
		  render json: timeslots, date: params[:date],status: 200	
		else
		  render json: timeslots, status: 200
		end
	end
	
	def create
		timeslot = Timeslot.new(timeslot_params)
		if timeslot.save
			render json: timeslot, status: 201
		else
			render json: timeslot.errors, status: :unprocessable_entity 
		end
	end

	private
	def timeslot_params
		params.require(:timeslot).permit(:start_time, :duration)
	end
end
