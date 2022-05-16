Rails.application.routes.draw do
  resources :courses
  resources :slides do
    collection do
      post 'update_order'
    end
    member do
      get 'navigation_buttons'
    end
  end
  root "static_pages#welcome"
  get 'static_pages/welcome'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
