require 'rails_helper'

describe "API V1" do
  describe "GET /api/v1/wishlist" do
    it "returns wishlist info", :vcr do
      get '/api/v1/wishlist?username=rip4me'

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:attributes]).to have_key(:albums)

      expect(json[:data][:attributes][:albums][0]).to have_key(:artist)
      expect(json[:data][:attributes][:albums][0]).to have_key(:title)
    end
    it "returns no wishlist info", :vcr do
      get '/api/v1/wishlist?username=aaa'

      expect(response.status).to eq 400
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:errors]).to eq "Bad username or missing username"
    end
  end
end
