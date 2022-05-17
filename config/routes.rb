Rails.application.routes.draw do
  resources :roles
  devise_for :users
  resources :quiz_questions
  resources :quizzes
  resources :courses do
    member do
      get 'course_overview'
    end
  end
  resources :slides do
    collection do
      post 'update_order'
    end
    member do
      get 'navigation_buttons'
      get 'exercise'
    end
  end
  root "static_pages#welcome"
  get 'static_pages/welcome'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
