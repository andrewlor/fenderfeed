Rails.application.routes.draw do
  root 'posts#index'
  get '/signup' => 'users#signup'
  get '/new' => 'application#new'
  get '/profile' => 'application#profile'
  get '/profile/edit' => 'application#profile_edit'
  post '/profile/edit/submit' => 'application#profile_edit_submit'

  resources :posts do
    resources :comments
    resources :likes
  end

  controller :posts do
    post '/posts/create' => :create
  end

  resources :users
  controller :users do
    post  'login' => :new
    post 'signup' => :create
    get 'logout' => :destroy
  end

  resources :categories
  controller :categories do
    get 'categories' => :index
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
