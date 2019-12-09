Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

require 'sidekiq/web'
mount Sidekiq::Web => "/sidekiq"

	devise_scope :user do
		root to: 'home#index'
		get "sign_in" => "devise/sessions#new"
		get "sign_out" => "devise/sessions#destroy"
	end

	resources :projects do
		resources :tasks do
			resources :comments
		end
	end

	resources :users
end
