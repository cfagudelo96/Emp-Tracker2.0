Rails.application.routes.draw do
  resources :trainings
  resources :training_executions
  resources :employees
  resources :companies
  resources :areas
end
