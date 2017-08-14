class Booking < ApplicationRecord
	include ActiveModel::Validations
	validates_with BookingValidator
  belongs_to :timeslot
	
	after_create :update_availability

	def update_availability
		timeslot = self.timeslot
		timeslot_multiple_boats(timeslot)
	end

	def timeslot_multiple_boats(timeslot)
		boats = timeslot.boats
		if boats.size > 1
			boats = boats.pluck(:capacity).min
		  timeslot.availability = boats
		  timeslot.customer_count = self.size
		  timeslot.save 
		else
			boat_multiple_timeslot(timeslot)
		end 
		
	end

	def boat_multiple_timeslot(timeslot)
    boat = timeslot.boats.first
    timeslots = boat.timeslots.where("timeslots.start_time < ? and timeslots.end_time > ? ",timeslot.end_time,timeslot.start_time)
    timeslots.each do |ts|
    	if ts == timeslot
    		ts.availability -= self.size
    		ts.customer_count = self.size
    	else
    		ts.availability = 0
    	end
    	ts.save
    end
	end
end
