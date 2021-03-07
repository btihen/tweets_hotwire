Rails.application.routes.draw do
  resources :tweets do
    resource :like, only: [:update]
    resource :retweet, only: [:create]
  end
  root to: "tweets#index"
end
