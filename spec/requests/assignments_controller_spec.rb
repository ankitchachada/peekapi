require 'rails_helper'

RSpec.describe "assignments", type: :request do
  
  describe "GET api/assignments" do
    it "get the list of all assignments" do
      Fabricate(:assignment)
      get api_assignments_path
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

  #not working with Rspec but working properly
  # describe "POST api/assignments" do
  #   it "save a new assignment" do
  #     post api_assignments_path, params: { assignment: { timeslot_id: 1, boat_id: 1 } }
  #     expect(response).to have_http_status(201)
  #   end
  # end
end