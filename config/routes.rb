Rails.application.routes.draw do
  resources :books
  devise_for :users
  root to: "homes#top"
  resources :users, only: [:index, :show, :edit, :update]
end
