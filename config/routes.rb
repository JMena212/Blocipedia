Rails.application.routes.draw do
  get 'charges_controller/index'

  get 'charges_controller/show'

  get 'charges_controller/new'

  get 'charges_controller/edite'

  resources :wikis
  
  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end
  devise_for :users
  root to: 'welcome#index'
end
