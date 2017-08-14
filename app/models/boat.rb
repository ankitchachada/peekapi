class Boat < ApplicationRecord
	has_many :assignments
  has_many :timeslots, through: :assignments
end
