Rails.application.routes.draw do
  get 'welcome/index'
  get "/signup" =>"users#signup",:as => "signup"
  get "/login" =>"users#login",:as => "login"
  get "/redirect" =>"welcome#redirect",:as => "redirect"
  post 'create_login_session' => 'users#create_login_session'
 
  delete "logout" => "users#logout", :as => "logout"

  #house
  get "/houses" =>"houses#index",:as => "houses"
  get "/houses/letters" =>"houses#letters"
  post "/houses/letters" =>"houses#letters"

  #admin
  get "/admin" =>"welcome#admin",:as => "admin"
   #userbooks
  get "/userbooks" =>"userbooks#index",:as =>"userbooks"
  get "/userbooks/publish" =>"userbooks#publish"
  #publish
  get "publish" =>"articles#publish",:as => "publish"
  #Allinfos
  get "/allinfos" =>"allinfos#index",:as =>"allinfos"
  get "/allinfos/newinfo" =>"allinfos#newinfo",:as =>"newinfo"
  #Oneinfos
  get "/allinfos/join/:allinfo_id/:user_id" =>"allinfos#join"
  #Shares
  get "/shares" =>"shares#index",:as => "shares"
  get "/shares/newshare" =>"shares#newshare",:as => "newshares"
  #Monthly
  get "/monthly" =>"monthly#index",:as => "monthly"
  #drift
  get "/drifts" =>"drifts#index",:as => "drifts"
  #swaps
  get "/swaps" =>"swaps#index",:as => "swaps"
  get "/swaps/newswap" =>"swaps#newswap",:as => "newswaps"
  get "/swaps/join/:swap_id/:user_id" =>"swaps#join"

  resources :users, only:[:create]
  resources :goodsinfos
  resources :userbooks
  resources :articles
  resources :allinfos
  resources :shares  
  resources :swaps
  resources :letters
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    root 'welcome#index'

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
