json.array! @vendor_products do |vendor_product|
  json.partial! 'vendor_products/vendor_product', vendor_product: vendor_product
 end
