Rails.application.routes.draw do
  resources :roles
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

  devise_for :users, controllers: { sessions: "devise/passwordless/sessions" }
  devise_scope :user do
      get "/users/magic_link",
      to: "devise/passwordless/magic_links#show",
      as: "users_magic_link"
  end

end
