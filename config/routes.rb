Rails.application.routes.draw do
  get 'wikis/index'

  get 'wikis/show'

  get 'wikis/new'

  get 'wikis/edit'

  resources :wikis
  
  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end
  devise_for :users
  root to: 'welcome#index'
end
