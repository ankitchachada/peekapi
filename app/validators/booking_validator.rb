class BookingValidator < ActiveModel::Validator

	def validate(record)
		#to check overflow booking
   	timeslot = record.timeslot
		capacity = timeslot.boats.pluck(:capacity).max
		if capacity < record.size
			record.errors.add(:capacity, "Customers cannot be booked beyond capacity")
		end
	end

end