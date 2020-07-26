class Wishlist
  attr_reader :id, :albums

  def initialize(albums)
    @id = 1
    @albums = albums
  end
end
