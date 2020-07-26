class Api::V1::WishlistController < ApplicationController
  def index
    albums = BandcampService.wishlist(query_params[:username])
    if albums.empty?
      render json: { errors: 'Bad username or missing username' }, status: :bad_request
    else
      render json: AlbumSerializer.new(Wishlist.new(albums)).serialized_json
    end
  end

  private

  def query_params
    params.permit(:username)
  end
end
