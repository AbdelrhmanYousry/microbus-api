class LatestOffersController < ApplicationController
  def fetchLatestOffers
  	@offers = Offer.limit(3).order(id: :desc)
  	render json: @offers
  end
end
