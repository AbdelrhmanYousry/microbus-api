json.array! @offers do |offer|
  json.partial! 'offers/offer', offer: offer
 end
