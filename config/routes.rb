Rails.application.routes.draw do
  resources :books
  devise_for :users
  root to: "homes#top"
  resources :users
  get "users" => "users#top"
end
