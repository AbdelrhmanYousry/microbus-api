json.extract! offer, :id, :name, :price, :deadline, :description, :target_count, :vendor_product_id, :balance, :created_at, :updated_at
# json.product_name (Product.find_by id: vendor_product_id.product_id).name
json.product_name offer.vendor_product.product.name
json.thumbnail "http://localhost:3000#{offer.thumbnail}"
