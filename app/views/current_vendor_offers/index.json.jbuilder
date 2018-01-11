json.array! @offers do |offer|
  json.partial! 'current_vendor_offers/current_vendor_offer', offer: offer
 end
