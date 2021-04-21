# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: 'home#index'

  get '/student/index', to: 'student#index'
  post '/student/index', to: 'student#create'

  get '/team/index', to: 'team#index'
  post '/team/index', to: 'team#create'

  get '/project/index', to: 'project#index'
  post '/project/index', to: 'project#create'

  get '/survey/complete', to: 'survey#complete'
  post '/survey/complete', to: 'survey#create'
  get '/survey/view', to: 'survey#view'

end