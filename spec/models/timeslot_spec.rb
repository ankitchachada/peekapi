require 'rails_helper'

RSpec.describe Timeslot, type: :model do
	subject { Fabricate(:timeslot) }
	
	context "when created" do
    it "should create endtime" do
    	subject.end_time = (Time.at(subject.start_time) + subject.duration.minutes).to_time.to_i 
      subject.save
      expect(subject.end_time).to be(1502546400)
    end
  end

end
