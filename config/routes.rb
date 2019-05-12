Rails.application.routes.draw do
#   root :to => 'home#orders'
#   mount ShopifyApp::Engine, at: '/'
#
#   get 'index' => 'home#index'
#   get 'orders' => 'home#orders'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Rails.application.routes.draw do


  resources :orders

  mount ShopifyApp::Engine, at: '/'

  # post 'fulfillment/fulfil_order'
  get 'fulfillment/fulfil_order'
  get 'fulfillment/fulfill_order_2'
  post 'fulfillment/fulfill_order_2'

  get 'modal' => "home#modal", :as => :modal
  get 'modal_buttons' => "home#modal_buttons", :as => :modal_buttons
  get 'regular_app_page' => "home#regular_app_page"
  get 'help' => "home#help"
  get 'pagination' => "home#pagination"
  get 'breadcrumbs' => "home#breadcrumbs"
  get 'buttons' => "home#buttons"
  get 'form_page' => "home#form_page"
  post 'form_page' => "home#form_page"
  get 'error' => 'home#error'
  get 'orders' => "home#orders"
  get 'order_old' => "home#order_old"
  get 'fulfill' => "fulfillment#fulfill"

  # post 'admin/api/products'

  post '/webhook/orders_create', to: 'webook#orders_create'

  # post 'shopify_api/products'


  controller :sessions do
      get 'login' => :new, :as => :login
      post 'login' => :create, :as => :authenticate
      get 'auth/shopify/callback' => :callback
      get 'logout' => :destroy, :as => :logout
  end
  root :to => 'home#index'
  resources :orders

  resources :store_products

  resources :products

end
