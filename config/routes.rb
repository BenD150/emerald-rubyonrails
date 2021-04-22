# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  get '/course', to: 'home#course'
  get '/courses', to: 'home#courses'

  get '/students', to: 'student#index'
  post '/students', to: 'student#create'

  get '/teams', to: 'team#index'
  post '/teams', to: 'team#create'

  get '/projects', to: 'project#index'
  post '/projects', to: 'project#create'

  get '/results', to: 'stat#index'

  get '/survey/complete', to: 'survey#complete'
  post '/survey/complete', to: 'survey#create'
  get '/survey/view', to: 'survey#view'

end