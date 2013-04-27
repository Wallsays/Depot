Depot::Application.routes.draw do
  get "admin" => "admin#index"

  # get "sessions/new"
  # get "sessions/create"
  # get "sessions/destroy"
  controller :sessions do
    get "login" => :new
    post "login" => :create
    delete "logout" => :destroy
  end

  resources :users
  resources :orders
  resources :carts

  resources :line_items do
    post 'decrement', on: :member
  end

  resources :products do
    get :who_bought, on: :member
  end

  get "store/index"
  root to: 'store#index', as: 'store'

end
