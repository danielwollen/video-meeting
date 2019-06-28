require 'test_helper'

class ShorturlsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @shorturl = Shorturl.create!
  end

  test "should get show" do
    get shorturl_path('MY-TOKEN')
    assert_response :success
  end

  test "should create token" do
    post shorturls_path
    assert_response :success
  end

  test "room should be open if token is right" do
    get shorturl_path(@shorturl.token)
    assert_response :success
    response = JSON.parse(@response.body)
    assert_equal response["room_open"], true
  end

  test "room should be closed if token is wrong" do
    get shorturl_path("WRONG-TOKEN")
    assert_response :success
    response = JSON.parse(@response.body)
    assert_equal response["room_open"], false
  end

  def teardown
    Shorturl.delete_all
  end
end
