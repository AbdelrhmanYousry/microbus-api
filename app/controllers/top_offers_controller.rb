class TopOffersController < ApplicationController
  def fetchTopOffers
  	@offers = Offer.where(status: 'progress').limit(3).joins(:buying_consumers).group("offers.id").order("count(offers.id) DESC")

  	# @offers= Offer.limit(3).joins(:buying_consumers).group('offers.id').order('COUNT(buying_consumers.id) DESC')

   end
end
