Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "jobs#index"
  devise_scope :user do
    root "devise/sessions#new"
  end  
  resources :clients
  resources :jobs
  resources :profiles
  resources :applies
  get "new_application", to: "applies#new_apply"
  # post "new_application", to: "applies#new_apply"
end
