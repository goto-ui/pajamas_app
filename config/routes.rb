Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get  '/info',    to: 'home#info'
  get  '/history',    to: 'home#history'
  get  '/show',    to: 'home#show'
end
