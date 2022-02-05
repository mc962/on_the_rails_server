require "test_helper"

class LandingsControllerTest < ApplicationControllerTestCase
  test "should get index" do
    get root_url
    assert_response :success
  end
end
