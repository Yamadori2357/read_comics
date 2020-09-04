Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  root 'read_comics#home'
  get    '/signup',    to: 'users#new'
  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  get  'search_users',   to: 'users#search_users', as: 'search_users'
  get  'users/:id/profile_edit',   to: 'users#profile_edit', as: 'profile_edit_user'
  patch '/users/:id/profile_edit',  to:'users#profile_update', as: 'profile_update'
  get  'users/:id/password_edit',   to: 'users#password_edit', as: 'password_edit_user'
  patch '/users/:id/password_edit',  to:'users#password_update', as: 'password_update'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
end