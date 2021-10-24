Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'
  get 'home/about' => 'homes#about'
  resources :books, only:[:index]
  resources :users, only:[:edit,:create,:index,:show,:destroy]
end
