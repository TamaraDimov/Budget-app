Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index] do
    resources :groups, only: %i[index new create show] do
      resources :payments, only: %i[new create]
    end
  end
  root 'users#index'
end
