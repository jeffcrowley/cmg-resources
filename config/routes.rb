Rails.application.routes.draw do
  get 'admin_pages/main'

  get 'admin_pages/users'

  get 'admin_pages/projects'

  get 'admin_pages/follows'

  root 'dashboard#main'

  devise_for :users

  resources :projects, except: :index
  resources :follows, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
