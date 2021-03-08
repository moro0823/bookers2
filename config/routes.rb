Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users,only:[:show, :edit, :index, :update]
  get "home/about" => "homes#about"
  root to: "homes#top"
end
