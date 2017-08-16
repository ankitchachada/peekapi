class Timeslot < ApplicationRecord
  has_many :assignments
  has_many :bookings
  has_many :boats, through: :assignments
  after_create :convert_end_time
  scope :find_by_date, lambda { |dt| where(start_time: convert_date(dt))}

  def self.convert_date(dt)
    split_date = dt.split('-').map &:to_i
    year, month, day = split_date[0], split_date[1], split_date[2]
    begining = Date.new(year,month,day).to_time.to_i
    ending = Date.new(year,month,day+1).to_time.to_i
    [begining...ending] 
  end

  def convert_end_time
    end_time = Time.at(self.start_time) + self.duration.minutes 
    self.end_time = end_time.to_time.to_i
    self.save  
  end
end
