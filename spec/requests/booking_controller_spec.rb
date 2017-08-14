require 'rails_helper'

RSpec.describe "bookings", type: :request do
  
  describe "GET api/bookings" do
    it "get the list of all bookings" do
      Fabricate(:booking)
      get api_bookings_path
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end
end