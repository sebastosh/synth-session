Rails.application.routes.draw do
  resources :instruments
  resources :sessions
  resources :users

  post "/login", to: "auth#login"
  post "/signup", to: "users#create"
  get "/profile", to: "users#profile"

end
