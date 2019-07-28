Rails.application.routes.draw do
  resources :user_sessions
  resources :session_instruments
  resources :instruments
  resources :sessions
  resources :users
  resources :messages
	resources :chats

  post "/login", to: "auth#login"
  post "/signup", to: "users#create"
  get "/profile", to: "users#profile"

  post "/new-session", to: "sessions#create"


	post '/chats/:chat_id/authorize', to: 'chats#open'
	post '/chats/:chat_id/add_message', to: 'chats#add_message'
	post '/chats/delete_message', to: 'chats#delete_message'

	mount ActionCable.server, at: '/cable'

end
