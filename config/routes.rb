HnTexter::Application.routes.draw do
  resources :domains
  resources :password_resets
	resources :sessions
	resources :users
	get "leave" => "sessions#destroy", :as => "leave"
	root :to => "home#index"
end