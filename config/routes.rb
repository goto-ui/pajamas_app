Rails.application.routes.draw do
  # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: {
          registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: [:show]
  root 'home#index'
  get  '/info',    to: 'home#info'
  get  '/history',    to: 'home#history'
end
