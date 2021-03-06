Rails.application.routes.draw do
  root 'questions#index'
  get 'questions/most_recent' => 'questions#most_recent'
  get 'questions/most_votes' => 'questions#most_votes'
  get 'questions/trending' => 'questions#trending'

  get 'register' => 'users#new', as: :register
  get 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login
  post 'session_create' => 'sessions#create', as: :session_create
  get '/tags' => 'tags#index'

  resources :users, only: :create
  resources :tags, only: [:index, :show]
  resource :session,  only: [:new, :create, :destroy]
  resource :votes, only: [:create]
  resource :comments, only: [:create]
  resources :questions, only: [:index, :show, :new, :create] do
    resources :answers, only: [:create]
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
