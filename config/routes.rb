Rails.application.routes.draw do
  resources :wishlists
  resources :items

  get "pages/home"

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root "wishlists#index", as: :authenticated_root
    end

    unauthenticated do
      root "pages#home", as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
