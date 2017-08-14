require 'rails_helper'

RSpec.describe Boat, type: :model do
  it { should have_many(:assignments) }
	it { should have_many(:timeslots) }
end
