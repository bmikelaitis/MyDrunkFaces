Rails.application.routes.draw do
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  #route for home page
   root 'welcome#index'
   get '/', to: "welcome#index"
   
   #routes for static pages
  get '/about', to: 'welcome#about'
  get '/index', to: 'welcome#index'
  get '/info', to: 'welcome#info'
  get '/legal', to: 'welcome#legal'
  get '/privacy', to: 'welcome#privacy'
  get '/contact', to: 'contacts#index'
  
    resources :faces do
      member do
        post 'like'
      end
      
    end
    
    resources :users, except: [:new]
    
    get '/register', to: 'users#new'
    
    resources :contacts
    
    get '/login', to: 'logins#new'
    post '/login', to: 'logins#create'
    get '/logout', to: 'logins#destroy'
    

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
