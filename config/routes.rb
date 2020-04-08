Rails.application.routes.draw do
  # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: {
          registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  resources :microposts,only: [:create, :destroy]
  resources :testsessions, only: :create
  root 'home#index'
  get  '/info',    to: 'home#info'
  get  '/history',    to: 'home#history'
  get  '/all_users', to:'users#all_users'
  get  '/prof', to: 'users#prof'
  get  '/posts_show', to:'users#posts_show'
  get   '/microposts/new', to:'microposts#new'
end
