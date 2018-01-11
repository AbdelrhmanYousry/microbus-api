json.extract! offer, :id, :name, :price, :description, :target_count, :status, :vendor_product_id, :balance, :created_at, :updated_at
json.deadline offer.deadline.to_i
json.product_name offer.vendor_product.product.name
json.thumbnail "http://localhost:3000#{offer.thumbnail}"
json.seller offer.vendor.name
json.progress offer.progress
# json.product_id offer.vendor_product.product.id
