Rails.application.routes.draw do

  scope :api, defaults: {format: :json} do
    devise_for :users, controllers: {sessions: 'sessions'}
    devise_scope :user do
      get 'users/current', to: 'sessions#show', as: 'current_user'
    end

    get '/twilio/token/:identity', to: 'twilio#token', as: 'twilio_token'
    post '/shorturls', to: 'shorturls#create', as: 'shorturls'
    get '/shorturls/:token', to: 'shorturls#show', as: 'shorturl'
  end

end
