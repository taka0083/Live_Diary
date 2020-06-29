Rails.application.routes.draw do

  devise_for :users
  root 'diaries#index'
  resources :users, only: [:show, :edit, :update]
  get 'users/:id/favorites' => 'users#favorites',as: 'users_favorite'
  get 'users/:id/follow' => 'users#follow',as: 'users_follow'
  get 'users/:id/follower' => 'users#follower',as: 'users_follower'
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

get 'diaries/follower' => 'diaries#follower',as: 'diaries_follower'
  resources :diaries, only: [:index,:show,:edit,:new,:update,:destroy,:create] do
  	resources :comments, only: [:create,:destroy]
  	resource :favorites, only: [:create,:destroy]
  end


end
