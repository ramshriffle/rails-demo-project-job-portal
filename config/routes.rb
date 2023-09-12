Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resource :users
  post 'user/login', to: 'users#login'
  resource :user_profiles
  resources :jobs
  resources :users_application
  resources :job_seekers, only: [:index]
  
  get 'view_all_jobs', to: 'job_seekers#view_all_jobs'

  get 'view_applied_job/:id', to: 'job_recruiters#view_applied_job'
  put 'accept_or_reject_job_application/:id', to: 'job_recruiters#accept_or_reject_job_application'
  get 'view_accepted_job_application/:id', to: 'job_recruiters#view_accepted_job_application'
  get 'view_rejected_job_application/:id', to: 'job_recruiters#view_rejected_job_application'
end
