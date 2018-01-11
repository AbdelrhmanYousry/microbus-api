require 'test_helper'

class TopOffersControllerTest < ActionDispatch::IntegrationTest
  test "should get fetchTopOffers" do
    get top_offers_fetchTopOffers_url
    assert_response :success
  end

end
