Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      resources :users
      resources :sessions
      resources :road_trips
    end
  end
end
