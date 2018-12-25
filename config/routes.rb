Rails.application.routes.draw do
  root 'pages#home'

  resources :admins do
    resources :courses
    resources :instructors
    resources :students
    resources :cohorts
  end

  get 'logout', to: 'admins#destroy'

end
