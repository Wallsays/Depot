Depot::Application.routes.draw do
  get "admin" => "admin#index"

  controller :sessions do
    get "login" => :new
    post "login" => :create
    # delete "logout" => :destroy
    get "logout" => :destroy
  end

  # Вложение объявления ресурсов и исходных точек входа в объявление 
  # области видимости для :locale. 
  # Кроме того, обозначение :locale взято в круглые скобки, 
  # что является способом сообщить о его необязательном характере. 
  scope '(:locale)' do
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

end
