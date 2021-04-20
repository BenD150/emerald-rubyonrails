# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  get '/student/index', to: 'student#index'
  post '/student/index', to: 'student#create'

  get '/team/index', to: 'team#index'
  post '/team/index', to: 'team#create'


end