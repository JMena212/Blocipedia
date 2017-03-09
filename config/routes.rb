Rails.application.routes.draw do
 resources :charges, only: [:new, :create, :destroy, :delete]

  resources :wikis 
  resources :collaborations, only: [:create, :destroy]
  
  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end
  devise_for :users
  root to: 'welcome#index'
end
