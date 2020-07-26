class Api::V1::WishlistController < ApplicationController
  def index
    albums = BandcampService.wishlist(query_params[:username])
    unless albums.empty?
      render json: AlbumSerializer.new(Wishlist.new(albums)).serialized_json
    else
      render json: { errors: "Bad username or missing username" }, status: 400
    end
  end

  private

  def query_params
    params.permit(:username)
  end
end
