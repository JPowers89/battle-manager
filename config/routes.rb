Rails.application.routes.draw do
  root    'static_pages#home'

  get     '/new',        to: 'static_pages#show'

  post    '/login',      to: 'sessions#create'
  delete  '/logout',     to: 'sessions#destroy'
  get     '/register',   to: 'users#register'

  resources :users
  resources :combats, only: %i[create show new index update] do
    member do
      post 'next'
      post 'previous'
      get 'roll'
      get 'damage'
      get 'heal'
      get 'add'
      post 'remove'
      post 'stop'
    end
  end

  resources :combatants
  resources :characters
end
