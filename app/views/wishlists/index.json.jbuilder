json.array! @wishlists do |wishlist|
  json.partial! 'wishlists/wishlist', wishlist: wishlist
 end
