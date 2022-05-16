Rails.application.routes.draw do
  resources :courses
  resources :slides
  root "static_pages#welcome"
  get 'static_pages/welcome'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
