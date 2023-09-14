# config/routes.rb
Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index] do
    resources :groups, only: [:index, :new, :create, :show] do
      resources :payments, only: [:new, :create]
    end
  end

  root 'users#index' # This sets the root path to the UsersController#index action.
end
