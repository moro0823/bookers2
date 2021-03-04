Rails.application.routes.draw do
  resources :books
  devise_for :users
  root to: "homes#top"
  resources :users, only: [:show, :edit, :update]
end
