require 'rails_helper'

describe BandcampService do
  context "instance methods" do
    context "#info" do
      it "returns no album(s) info", :vcr do
        albums = BandcampService.wishlist('aaa')

        expect(albums).to eq []
      end
      it "returns album(s) info", :vcr do
        albums = BandcampService.wishlist('rip4me')

        expect(albums).to be_a Array
        expect(albums.first).to be_a Album
      end
    end
  end
end
