class AssignmentValidator < ActiveModel::Validator

	def validate(record)
		timeslot = record.timeslot
		timeslots = record.boat.timeslots.where("timeslots.start_time < ? and timeslots.end_time > ? ",timeslot.end_time,timeslot.start_time)
		if timeslots.count > 0
		  record.errors.add(:Assignment, "Boat cannot be assign at this timeslot")
		end
	end


end