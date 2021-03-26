Rails.application.routes.draw do
  get 'static/Pages'
  get 'static/home'
  get 'static/help'
  get 'static/about'
  resources :microposts
  resources :users
  root 'users#index'
  #get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
