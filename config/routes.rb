# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  root to: 'welcome#index'

  get '/student/index', to: 'student#index'
  post '/student/index', to: 'student#create'

  get '/team/index', to: 'team#index'
  post '/team/index', to: 'team#create'


end
#2: name of controller - name of method
# 8 things will be written here. 5 things will be get, 3 things will be post