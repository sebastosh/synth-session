Rails.application.routes.draw do
  resources :instruments
  resources :sessions
  resources :users
  resources :messages
	resources :jams

  post "/login", to: "auth#login"
  post "/signup", to: "users#create"
  get "/profile", to: "users#profile"

  post "/new-session", to: "sessions#create"


	post '/jams/:jam_id/authorize', to: 'jams#open'
	post '/jams/:jam_id/add_message', to: 'jams#add_message'
	post '/jams/delete_message', to: 'jams#delete_message'

	mount ActionCable.server => '/cable'

end
