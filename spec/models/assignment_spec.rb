require 'rails_helper'

RSpec.describe Assignment, type: :model do
  describe "associations" do
  	it { should belong_to(:boat) }
  	it { should belong_to(:timeslot) }
  end
end
