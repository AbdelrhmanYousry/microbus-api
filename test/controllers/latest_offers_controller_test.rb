require 'test_helper'

class LatestOffersControllerTest < ActionDispatch::IntegrationTest
  test "should get fetchLatestOffers" do
    get latest_offers_fetchLatestOffers_url
    assert_response :success
  end

end
