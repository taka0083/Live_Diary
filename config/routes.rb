Rails.application.routes.draw do

  devise_for :users
  root 'diaries#index'
  resources :users, only: [:show, :edit, :update]
  resources :diaries, only: [:index,:show,:edit,:new,:update,:destroy,:create]

end
