Rails.application.routes.draw do
  resources :attendances
  resources :trainings do
    collection do
      get 'all'
    end
  end
  resources :training_executions do
    member do
      get 'register_attendances'
      patch 'save_attendances'
    end
  end
  resources :employees
  resources :companies
  resources :areas
end
