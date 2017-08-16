class Assignment < ApplicationRecord
  belongs_to :boat 
  belongs_to :timeslot
  after_commit :update_availability_in_timeslot
  validates :boat_id, uniqueness: { scope: :timeslot_id, message: "validation: You cannot assign same boat at a same timeslot"} 
  include ActiveModel::Validations
  validates_with AssignmentValidator
  
  #this method is to update the availability in timeslots table
  def update_availability_in_timeslot
    timeslot = Timeslot.find(self.timeslot_id)
    occupied_seats = timeslot.bookings.count > 0 ? timeslot.bookings.sum(:size) : 0
    if timeslot.boats.count > 1
      timeslot.availability = timeslot.boats.pluck(:capacity).max
      timeslot.save
    else
      timeslot.availability = timeslot.boats.pluck(:capacity)[0]
      timeslot.save
    end
  end
end
