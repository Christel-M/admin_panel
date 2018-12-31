Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#home'

  resources :sessions, only: [:new, :create, :index, :destroy]

  resources :admins do
    resources :courses
    resources :instructors
    resources :students
    resources :cohorts
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'
  get 'admins', to: 'pages#home'


end
