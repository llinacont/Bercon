Bercon::Application.routes.draw do


  resources :companies

  resources :roles                      
  
  resources :demands do
    get :autocomplete_client_name, :on => :collection
    get :autocomplete_product_title, :on => :collection
  end
   
  resources :line_items
  
  devise_for :users do
    
    resources :products 
    
    resources :clients
    
    resources :events
    
 end
 
 
 get    'users/new', :controller => 'users', :action => 'new'
 post   'users/new', :controller => 'users', :action => 'create'
 get    'users/:id', :controller => 'users', :action => 'show' 
 post   'users/update', :controller => 'users', :action => 'update'                   
 get    '/create_line_item', :controller => 'demands', :action => 'create_line_item' 
 post   '/create_line_item' , :controller => 'demands', :action => 'create_line_item' 
  
   
  namespace :home do
    get 'hello'
    get 'info'
    get 'infoProd'
    get 'company'
    get 'contact'
  end
  
  resources :center
  
  get 'dealer', :controller => 'center', :action => 'dealer'
  
  get 'seller', :controller => 'center', :action => 'seller'

  
  get 'registration_companies', :controller => 'companies', :action => 'registration_companies'
   
  get 'registration_products', :controller => 'products', :action => 'registration_products'
  
  get 'registration_clients', :controller => 'clients', :action => 'registration_clients'
  
  post 'join_to_company', :controller => 'companies', :action => 'join_to_company'
  
  post 'new_message', :controller => 'center', :action => 'process_new_message'
  
  post 'generate_bill', :controller => 'demands', :action => 'process_create_bill'
   
  root :to => 'home#hello'
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
end