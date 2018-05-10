Rails.application.routes.draw do

root 'home#index'

get 'home/contact' => 'home#contact', as: 'contact' 

get 'product/index'
get 'product/show'
get 'product/search'

get      'account/index'
post     'account/create' => 'account#create'
delete   'account/logout' => 'account#destroy' 

#get      'admin/index'
#get      'admin/new' => 'admin#new'
#post     'admin' => 'admin#create'
#get      'admin/:id/edit' => 'admin#edit', as: "admin_edit" 
#delete   'admin/delete/:id' => 'admin#destroy', as: "admin_delete" 
#patch    'admin/update/:id' => 'admin#update', as: "admin_update"  
#post     'admin/create_product' => 'admin#create_product'
#post     'admin/create_user' => 'admin#create_user'

resources :admin
delete   'admin/:id' => 'admin#destroy', as: "admin_delete"
post     'admin/change_status' => 'admin#change_status', as: "product_status"
post     'admin/menu_handler' => 'admin#menu_handler'
get      'admin/menu_handler' => 'admin#menu_handler'
post     'admin/sort_by_product_type' => 'admin#sort_by_product_type', as: "sort_by_product_type"
post     'admin/change_favorit_status' => 'admin#change_favorit_status', as: "change_favorit_status"

post     'picture/picture_handler' => 'picture#picture_handler', as: 'assign_picture'
get      'picture/gallery' => 'picture#gallery', as: 'gallery'
post     'picture/gallery' => 'picture#gallery'
resources :picture

resources :slideshow

#resources :soups
#resources :sandwiches
#resources :smallsalad
#resources :bigsalad

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
