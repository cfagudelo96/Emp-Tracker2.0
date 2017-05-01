Rails.application.routes.draw do
  resources :trainings do
    resources :training_executions
  end
  resources :employees
  resources :companies
  resources :areas
end
