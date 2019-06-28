class ShorturlsController < ApplicationController
  def create
    @shorturl = Shorturl.create!
    render json: { shorturl: @shorturl.token }
  end

  def show
    if Shorturl.where(token: params[:token]).empty?
      render json: { room_open: false }
    else
      render json: { room_open: true }
    end
  end
end
