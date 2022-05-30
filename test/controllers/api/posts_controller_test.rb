require "test_helper"

class API::PostsControllerTest < ApplicationControllerTestCase
  setup do
    @post = FactoryBot.create(:post_with_user)
    @user = @post.author
    sign_in @user
  end

  test "should get index" do
    get api_posts_url
    assert_response :success
  end

  test "should show post" do
    get api_post_url(@post)
    assert_response :success
  end
end
