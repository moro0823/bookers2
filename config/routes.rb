Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :index, :show, :destroy]
  end

  resources :users,only:[:show, :edit, :index, :update]
  get "home/about" => "homes#about"
  root to: "homes#top"
end
