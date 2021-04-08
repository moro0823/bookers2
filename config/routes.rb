Rails.application.routes.draw do
  get 'search/search'
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :passwords => 'users/passwords'
  }
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :index, :show, :destroy]
  end

  resources :users,only:[:show, :edit, :index, :update]
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'user/follow' => 'relationships#index'
  get '/search' => 'search#search'
  get "home/about" => "homes#about"
  root to: "homes#top"
end
