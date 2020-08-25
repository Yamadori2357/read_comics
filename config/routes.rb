Rails.application.routes.draw do
  get 'read_comics/home'
  root 'read_comics#home'
end
