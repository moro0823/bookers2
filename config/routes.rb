Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :index, :show, :destroy]
  end

  resources :users,only:[:show, :edit, :index, :update]
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'user/follow' => 'relationships#index'
  get "home/about" => "homes#about"
  root to: "homes#top"
end
