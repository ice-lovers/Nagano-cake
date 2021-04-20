Rails.application.routes.draw do

  root to: 'customers/products#top'


  scope module: :customers do
    get 'about' => 'products#about'
  end
  
  scope module: :customers do
    get 'customers/edit', to: 'customers#edit'
    patch 'customers', to: 'customers#update'
  end

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  namespace :admins do
    resources :products, except: [:destroy]
    resources :categories, except: [:new, :show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders,only: [:index, :show, :update]
  end

  scope module: :customers do
    resources :cart_items, except: [:new, :show, :edit]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    get 'customers', to: 'customers#show'
    get 'customers/unsubscribe', to: 'customers#unsubscribe'
    patch 'customers/out', to: 'customers#out'
  end

  scope module: :customers do
    resources :deliveries, except: [:show]
  end
  
  scope module: :customers do
    resources :products, only: [:show, :index]
  end

end