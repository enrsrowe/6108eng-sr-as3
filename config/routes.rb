Osc::Application.routes.draw do
  resources :statuses

    #For Facebook login
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessons#destroy', as: 'signout'


  get "author_sessions/controller"

  get "author_sessions/new"

  get "tags/index"

  get "tags/show"

  get "welcome/index"
  match 'home' => 'welcome#index' #added to allow page shortcuts
  match 'index' => 'welcome#index'

  get "welcome/getstarted"
  match 'getstarted' => 'welcome#getstarted'

  get "welcome/whatson"
  match 'whatson' => 'welcome#whatson'

  get "welcome/aboutus"
  match 'aboutus' => 'welcome#aboutus'

  get "welcome/race"
  match 'race' => 'welcome#race'

  get "welcome/gallery"
  match 'gallery' => 'welcome#gallery'


  get "welcome/joinus"
  match 'joinus' => 'welcome#joinus'


  get "welcome/access"

  get "welcome/login"

  resources :events

  resources :articles

  resources :comments

  resources :tags

  resources :authors

  resources :author_sessions,
            only: [ :new, :create, :destroy]
            
  match 'login' => 'author_sessions#new'
  match 'logout' => 'author_sessions#destroy'



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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
