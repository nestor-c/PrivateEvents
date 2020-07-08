Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, except: [:index]
  resources :events
  resources :sessions
  root "events#index"
end
