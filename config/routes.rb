Rails.application.routes.draw do
  resources :tweets do
    resource :like, only: [:create]
    resource :retweet, only: [:create]
  end
  root to: "tweets#index"
end
