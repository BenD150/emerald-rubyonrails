Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'
  get '/student/get_students', to: 'student#get_students'
  post '/student/get_students', to: 'student#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
#2: name of controller - name of method
# 8 things will be written here. 5 things will be get, 3 things will be post