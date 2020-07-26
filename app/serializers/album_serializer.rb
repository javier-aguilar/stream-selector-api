class AlbumSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  set_type :wishlist
  attributes :albums
end
