Rails.application.routes.draw do
 resources :charges, only: [:new, :create]

  resources :wikis
  
  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end
  devise_for :users
  root to: 'welcome#index'
end
