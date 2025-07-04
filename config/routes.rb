Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      get 'user', to: 'users#show'
      resources :user_courses, only: [:index]
      resources :user_course_levels, only: [:index]
      resources :courses, only: [:index, :show], param: :slug do
        get 'course_levels/:point_type/:position', to: 'course_levels#show'

        # Add course_levels routes for kanjis, vocabularies, grammars
        get 'course_levels/kanjis', to: 'courses/course_levels#index_kanjis'
        get 'course_levels/vocabularies', to: 'courses/course_levels#index_vocabularies'
        get 'course_levels/grammars', to: 'courses/course_levels#index_grammars'

        get 'course_levels/kanjis/:position', to: 'courses/course_levels#show_kanjis'
        get 'course_levels/vocabularies/:position', to: 'courses/course_levels#show_vocabularies'
        get 'course_levels/grammars/:position', to: 'courses/course_levels#show_grammars'

        namespace :course_lessons do
          get 'kanjis/:position', to: 'course_lessons#kanjis'
          get 'vocabularies/:position', to: 'course_lessons#vocabularies'
          get 'grammars/:position', to: 'course_lessons#grammars'
        end
      end
      resources :user_reviews, only: [:index] do
        collection do
          post :correct_review
          post :incorrect_review
          get :due_reviews
        end
      end

      resources :point_of_the_days, only: [] do
        collection do
          get :today
        end
      end
    end
  end
end
