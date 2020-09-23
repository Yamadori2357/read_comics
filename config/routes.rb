Rails.application.routes.draw do
  root 'read_comics#home'
  get    '/signup',                   to: 'users#new'
  get    '/login',                    to: 'sessions#new'
  post   '/login',                    to: 'sessions#create'
  delete '/logout',                   to: 'sessions#destroy'
  get    'search_users',              to: 'users#search_users',     as: 'search_users'
  get    'users/:id/profile_edit',    to: 'users#profile_edit',     as: 'profile_edit_user'
  patch  '/users/:id/profile_edit',   to: 'users#profile_update',   as: 'profile_update'
  get    'users/:id/password_edit',   to: 'users#password_edit',    as: 'password_edit_user'
  patch  '/users/:id/password_edit',  to: 'users#password_update',  as: 'password_update'
  get    'search_comics',             to: 'comics#search_comics',   as: 'search_comics'
  resources :users do
    member do
      get :following, :followers, :liked_microposts, :favorited_comics
    end
  end
  resources :bookmarks,           only: [:create, :destroy]
  resources :likes,               only: [:create, :destroy]
  resources :comics,              only: [:show, :new, :create] do
    collection do
      get :favorited_ranks
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end