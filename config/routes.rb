Rails.application.routes.draw do



  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admin/sign_in' => 'admin/sessions#new', as: 'new_admin_session'
    post 'admin/sign_in' => 'admin/sessions#create', as: 'admin_session'
    delete 'admin/sign_out' => 'admin/sessions#destroy', as: 'destroy_admin_session'
  end


  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  #devise_for :customers, skip: :all
  #devise_scope :customer do
   # get 'customers/:id/password/new' => 'customers/passwords#new', as: 'new_customer_password'
    #get 'customers/:id/password/edit' => 'customers/passwords#edit', as: 'edit_customer_password'
    #post 'customers/:id/password/edit' => 'customers/passwords#update'
    #get 'customers/password/new' => 'customers/passwords#new'
  #end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get  'admin' => 'admin/homes#top'
  namespace :admin do
  	resources :items, only:[:new, :create, :index, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
	end

  # get  'items' => 'customer/items#index', as: "customer_items"
  # get  'items/:id' => 'customer/items#show', as: "customer_item"
  # resources :cart_items, only:[:create, :index, :update, :destroy] do
  #   collection do
  #     delete 'destroy_all'
  #   end
  # end

  #get "admin/orders/:id" => "admin/orders#show", as: "admin_order"
  #patch "admin/orders/:id" => "admin/orders#update"
  # get '/search' => 'search#search'



#  get "orders/new" => "public/orders#new"
#  get "orders/confirm" => "public/orders#confirm"
#  post "orders/confirm" => "public/orders#create"
#  get "thanks" => "public/orders#thanks"
#  get "orders", to: "/public/orders#index", as: "customer_orders"
#  get "orders/:id", to: "public/orders#show", as: "customer_order"
  get 'about', to: 'public/homes#about', as: "about"
#  patch "customers/:id/quit" => "customer/customers#invalid", as: "invalid_customer"

  patch "customers/:id/quit" => "customer/customers#invalid", as: "invalid_customer"


  scope module: 'public' do
    post "orders/confirm" => "orders#confirm"
    get "orders/thanks" => "orders#thanks"
     get 'genres/:id/search' => 'searches#genre_search'
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
        root 'homes#top'
        get "about" => "homes#about"
    
       resources :items, only:[:index, :show]
        resources :cart_items, only:[:create, :index, :update, :destroy] do
    collection do
      delete 'destroy_all'
    end
  end
      # get 'genres/:id/search' => 'searches#genre_search'
      get '/customers/my_page', to: '/public/customers#show', as: 'customer_my_page'
      get '/customers/information/edit', to: '/public/customers#edit', as: 'edit_customer', format: false
      patch '/customers/information', to: '/public/customers#update', as: 'information'
      get '/customers/quit', to: 'customers#quit', as: 'quit'
      get '/customers/unsubscribe', to: '/public/customers#unsubscribe', as: 'unsubscribe_customer'
      patch '/customers/withdraw', to: '/public/customers#withdraw', as: 'withdraw_customer'







     # resources :customers do
      #member do
      #  patch :withdraw
      #  get :unsubscribe
      #end
      #end

      resources :'mailing_addresses', only:[:index, :create, :edit, :update, :destroy]
    end
   end

  #scope module: :public do
    #post "orders/confirm" => "orders#confirm"
    #get "orders/thanks" => "orders#thanks"
    #resources :orders, only: [:new, :create, :index, :show]post "orders/confirm" => "orders#confirm"
    #get "orders/thanks" => "orders#thanks"
    #resources :orders, only: [:new, :create, :index, :show]resources :orders, only: [:new, :create, :index, :show]
  #end
