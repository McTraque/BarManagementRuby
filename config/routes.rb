Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :orders do
    resources :items
  end

  resources :employees do
    member do
      get :disable
      get :enable
    end
  end

  resources :benches do
    member do
      get :libre
      get :ocupada
    end
  end

  resources :product_types

  resources :products do
    resources :transactions
    member do
      get :disable
      get :enable
    end
  end

  resources :providers do
    member do
      get :disable
      get :enable
    end
  end


  devise_for :users

  get 'eventos/index'

  get 'productos/index'

  get 'welcome/index'
  root 'welcome#index'
  resources :productos, :eventos


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
