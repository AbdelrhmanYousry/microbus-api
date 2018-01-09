<<<<<<< HEAD
json.extract! offer, :id, :name, :price, :deadline, :description, :target_count, :vendor_product_id, :balance, :created_at, :updated_at
=======
json.extract! offer, :id, :name, :price, :deadline, :description, :target_count, :status, :vendor_product_id, :balance, :created_at, :updated_at
>>>>>>> 5f9cc60efff9f89b57fa6df150cc9f9ac800954d
json.product_name offer.vendor_product.product.name
json.thumbnail "http://localhost:3000#{offer.thumbnail}"
json.seller offer.vendor.name
json.progress offer.progress
# json.product_id offer.vendor_product.product.id
