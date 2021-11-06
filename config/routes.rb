Rails.application.routes.draw do
  get 'search' => 'searches#search'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'book_comments/create'
  get 'book_comments/destroy'
  devise_for :users
  root to:'homes#top'
  get 'home/about' => 'homes#about'
  resources :users do
    resource :relationships, only: [:create, :destroy, :followings, :followers]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end

end
