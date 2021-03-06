Rails.application.routes.draw do
  resources :cost_benefit_analyses
  resources :clozes
  resources :open_questions
  resources :checkboxes
  resources :checkbox_exercises
  resources :media
  resources :point_systems
  resources :accounts do
    member do
      put 'update_course_history'
      put 'update_excercise_history'
      get 'get_points_from_course'
    end
  end
  resources :roles
  devise_for :users
  #devise_for :users, controllers: { sessions: "devise/passwordless/sessions" }
  devise_scope :user do
    get "/users/magic_link",
      to: "devise/passwordless/magic_links#show",
      as: "users_magic_link"

      get "/users/send_magic_link_to_user",
      to: "devise/passwordless/magic_links#send_magic_link_to_user",
      as: "send_magic_link_to_user"
  end


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
