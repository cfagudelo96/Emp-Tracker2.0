Rails.application.routes.draw do
  resources :trainings do
    collection do
      get 'all'
    end
  end
  resources :training_executions
  resources :employees
  resources :companies
  resources :areas
end
