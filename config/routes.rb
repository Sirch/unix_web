UnixWeb::Application.routes.draw do

  get "myip/index"

  get "server_racks/new"
  get "server_racks/index"
  get "server_racks/show"
  get "server_racks/edit"

  resources :users
  resources :projects
  resources :server_models
  resources :server_racks
  resources :servers
  resources :changes
  resources :reports
  resources :sessions, only: [:new, :create, :destroy]
  
  root to: 'static_pages#home'
  
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/help', to: 'static_pages#help'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  
  match '/projects/new', to: 'projects#new'
  match '/servers/new', to: 'servers#new'
  match '/changes/new', to: 'changes#new'
  
  match '/servers/:id/clone', to: 'servers#clone'
  match '/servers/:id/power_off', to: 'servers#power_off'
  match '/servers/:id/power_on', to: 'servers#power_on'
  match '/servers/:id/decommission', to: 'servers#decommission'



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  match ':controller(/:action(/:id))(.:format)'
end
