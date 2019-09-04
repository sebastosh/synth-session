Rails.application.routes.draw do
  resources :user_sessions
  resources :session_instruments
  resources :instruments
  resources :sessions
  resources :users

  post "/login", to: "auth#login"
  post "/signup", to: "users#create"
  get "/profile", to: "users#profile"

  post "/new-session", to: "sessions#create"

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end


end
