require 'rails_helper'

RSpec.describe "Timeslots", type: :request do

  describe "GET api/timeslots" do
    it "get the list of all timeslots" do
      10.times { Fabricate(:timeslot) }
      get api_timeslots_path
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET api/timeslots?date=YYYY-MM-DD" do
    it "get the list of all timeslots" do
      10.times { Fabricate(:timeslot) }
      get api_timeslots_path(date: '2017-08-12')
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST api/timeslot" do
    it "save a new timeslot" do
      post api_timeslots_path, params: { timeslot: { start_time: 1502539200, duration: 120 } }
      expect(response).to have_http_status(201)
    end
  end
end