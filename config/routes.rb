Rails.application.routes.draw do
  root    'static_pages#home'

  get     '/new',        to: 'static_pages#show'

  post    '/login',      to: 'sessions#create'
  delete  '/logout',     to: 'sessions#destroy'
  get     '/register',   to: "users#register"

  resources :users
  resources :combats, only: [:create, :show, :new, :index] do
    member do
      get 'next'
      get 'previous'
      get 'roll'
      get 'damage'
      get 'heal'
      get 'add'
      get 'remove'
    end
  end

  resources :combatants
  resources :characters
end
