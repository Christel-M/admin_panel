Rails.application.routes.draw do
  root 'pages#home'

  resources :admins do
    resources :courses
    resources :instructors
    resources :students
    resources :cohorts
  end

  # get    'admins/login',   to: 'sessions#new'
  # post   'admins/login',   to: 'sessions#create'
  # delete 'admins/logout',  to: 'sessions#destroy'
  get 'logout', to: 'admins#destroy'

end
