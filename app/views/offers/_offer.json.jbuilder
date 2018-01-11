json.extract! offer, :id, :name, :price, :deadline, :description, :target_count, :status, :vendor_product_id, :balance, :created_at, :updated_at
json.product_name offer.vendor_product.product.name
json.thumbnail offer.thumbnail.url
json.seller offer.vendor.name
json.progress offer.progress
json.buying_consumers offer.buying_consumers.count
 # json.product_id offer.vendor_product.product.id
