require 'test_helper'

class TwilioControllerTest < ActionDispatch::IntegrationTest
  test "should return token" do
    get twilio_token_path('Username')
    assert_response :success
    response = JSON.parse(@response.body)
    assert response["token"].length > 10
  end
end
