class TwilioController < ApplicationController
  def token
    # Required for any Twilio Access Token
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    api_key = ENV['TWILIO_API_KEY']
    api_secret = ENV['TWILIO_API_SECRET']
    identity = params[:identity]

    # Create Video grant for our token
    grant = Twilio::JWT::AccessToken::VideoGrant.new

    # Create an Access Token
    token = Twilio::JWT::AccessToken.new(
      account_sid,
      api_key,
      api_secret,
      [grant],
      identity: identity
    )

    render json: {
      identity: identity,
      token: token.to_jwt
    }
  end
end
