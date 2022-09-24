Rails.application.routes.draw do
  resources :comments
  resources :cost_benefit_analyses
  resources :clozes
  resources :open_questions
  resources :checkboxes
  resources :checkbox_exercises
  resources :media
  resources :point_systems
  resources :accounts do
    member do
      put 'update_course_status'
      put 'update_course_history'
      put 'update_excercise_history'
      get 'get_points_from_course'
      get 'check_if_medal_is_awarded'
      post 'send_results_to'
      post 'save_progress'
    end
    collection do
      get 'dashboard'
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

  post "/users/check_if_email_is_taken", to: "users#check_if_email_is_taken", as: "users_check_if_email_is_taken"


  resources :quiz_questions
  resources :quizzes
  localized do
    resources :courses do
      member do
        get 'course_overview'
        get 'show_with_swipe'
      end
    end
    get "/courses/:id/:sort", to: "courses#show", as: "course_with_sort"
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

  get '/static_pages/preparer', to: "static_pages#preparer", as: 'preparer'
  post '/static_pages/preparer/', to: "static_pages#preparer"
end
