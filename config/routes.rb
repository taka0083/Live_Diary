Rails.application.routes.draw do

  devise_for :users
  root 'diaries#index'
  resources :users, only: [:show, :edit, :update]
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  
  resources :diaries, only: [:index,:show,:edit,:new,:update,:destroy,:create] do
  	resources :comments, only: [:create,:destroy]
  	resources :favorites, only: [:create, :destroy]
  end

end
