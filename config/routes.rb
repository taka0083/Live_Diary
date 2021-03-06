Rails.application.routes.draw do
  root 'home#top'


  devise_for :users

  resources :users, only: [:show, :edit, :update]
  get 'users/:id/favorites' => 'users#favorites',as: 'users_favorite'
  get 'users/:id/follow' => 'users#follow',as: 'users_follow'
  get 'users/:id/follower' => 'users#follower',as: 'users_follower'
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  get 'diaries/following' => 'diaries#following',as: 'diaries_following'
  get 'diaries/search' => 'diaries#search',as: 'diaries_search'
  resources :diaries, only: [:index,:show,:edit,:new,:update,:destroy,:create] do
  	resources :comments, only: [:create,:destroy]
  	resource :favorites, only: [:create,:destroy]
  end



end
