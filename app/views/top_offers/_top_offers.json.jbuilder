json.extract! offer, :id, :name, :price, :deadline, :description, :target_count, :status, :vendor_product_id, :balance, :created_at, :updated_at
json.product_name offer.vendor_product.product.name
json.thumbnail offer.thumbnail.url
json.seller offer.vendor.name
json.buying_consumers offer.buying_consumers
json.progress offer.progress
