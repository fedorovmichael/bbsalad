Rails.application.routes.draw do

get 'product/index'
get 'product/show'
get 'product/search'

root 'home#index'
#resources :soups
#resources :sandwiches
#resources :smallsalad
#resources :bigsalad

get 'admin/index'
post 'admin/index' => 'admin#create'
post 'admin/create_product' => 'admin#create_product'
post 'admin/create_user' => 'admin#create_user'


#  get 'soups/index'

#  get 'soups/show'

#  get 'sandwiches/index'

#  get 'sandwiches/show'

#  get 'smallsalad/index'

#  get 'smallsalad/show'

#  get 'bigsalad/index'

#  get 'bigsalad/show'

#  get 'home/index'
#  
#  
#  match '/index',        to: 'home#index',         via: 'get'
#  match '/bigsalad',     to: 'home#bigsalad',      via: 'get'
#  match '/sandwiches',   to: 'home#sandwiches',    via: 'get'
#  match '/smallsalad',   to: 'home#smallsalad',    via: 'get'
#  match '/soups',        to: 'home#soups',         via: 'get'
#  match '/bigsalad-edit',     to: 'home#bigsalad_edit',      via: 'get'
#  match '/sandwiches-edit',   to: 'home#sandwiches_edit',    via: 'get'
#  match '/smallsalad-edit',   to: 'home#smallsalad_edit',    via: 'get'
#  match '/soups-edit',        to: 'home#soups_edit',         via: 'get'


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
