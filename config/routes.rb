Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

devise_scope :user do
    root to: 'home#index'
    get "sign_up" => "devise/sessions#new"
    get "sign_out" => "devise/sessions#destroy"
end

end
