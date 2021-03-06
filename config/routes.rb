WorkoutWars::Application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  unauthenticated do
    root to: "static#index", as: :unauthenticated_root
  end
  
  authenticated :user do
    root to: "ember#start", as: :authenticated_root
  end

  get 'privacy' => 'static#privacy'
  get 'info' => 'static#info'
  get 'tutorials' => 'static#tutorials'

  namespace :api do
    namespace :v1 do
      resources :feeds, only: [:index]
      resources :competitions
      resources :challenges
      resources :challenge_attempts
      resources :users
      resources :user_notifications
      resources :notifications
      resources :device_tokens, only: [:index, :create, :destroy]
      resources :user_exercises
      resources :exercises
      resources :metrics
      resources :user_exercises
      resources :competition_exercises
      resources :competition_joins
      resources :competition_user_exercises
      resources :competition_win_conditions
      devise_for :users
      get 'current_user' => 'users#get_current_user'
      resources :feedbacks
    end
  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
