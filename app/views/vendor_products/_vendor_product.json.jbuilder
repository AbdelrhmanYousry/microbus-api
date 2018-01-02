json.extract! vendor_product, :id, :product_id
json.product_name (Product.find_by id: vendor_product.product_id).name
