json.extract! wishlist, :id, :product_id
json.product_name (Product.find_by id: wishlist.product_id).name
