require 'rails_helper'

RSpec.describe "Boats", type: :request do

  describe "GET api/boats" do
    it "get the list of all boats" do
      10.times { Fabricate(:boat) }
      get api_boats_path
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST api/boats" do
    it "save a new boat" do
      post api_boats_path, params: { boat: { capacity: 8, duration: 120 } }
      expect(response).to have_http_status(201)
    end
  end
end