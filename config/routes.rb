Rails.application.routes.draw do
  root 'read_comics#home'
  get  '/signup',  to: 'users#new'
  resources :users
end
