require "test_helper"

class PagesControllerTest < ApplicationControllerTestCase
  test "should get static pages" do
    get about_url
    assert_response :success

    get roadmap_url
    assert_response :success

    get attributions_url
    assert_response :success
  end
end
