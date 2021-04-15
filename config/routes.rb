Rails.application.routes.draw do
  resources :projects
  resources :comments
  resources :scores
  resources :teams
  devise_for :users
  get 'static/Pages'
  get 'static/home'
  get 'static/help'
  get 'static/about'
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
