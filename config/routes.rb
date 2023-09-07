Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resource :users
  post 'user/login', to: 'users#login'
  resource :user_profiles
  resources :jobs
  resources :users_application
  resources :job_recruiters, only: [:index,:update]
  get 'view_applied_job/:id', to: 'job_recruiters#view_applied_job'
  get 'view_all_jobs', to: 'job_seeker#view_all_jobs'
  get 'search_jobs/:job_title', to: 'job_seeker#search_job_by_job_title'

end
