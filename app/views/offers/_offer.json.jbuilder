json.extract! offer, :id, :name, :price, :description, :target_count, :status, :vendor_product_id, :balance, :created_at, :updated_at
json.product_name offer.product.name
json.thumbnail offer.thumbnail.url
json.seller offer.vendor.name
json.progress offer.progress
json.buying_consumers offer.buying_consumers.count
json.consumers offer.buying_consumers
json.deadline offer.deadline.in_time_zone("Africa/Cairo")-2.hour.to_i
