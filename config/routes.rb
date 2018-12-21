Rails.application.routes.draw do
  root 'pages#home'
  resources :cohorts
  resources :instructors
  resources :students
  resources :courses
end
