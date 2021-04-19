Rails.application.routes.draw do
  root to: 'customers/products#top'


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
    resources :products, only: [:new, :create, :index, :edit, :update, :show]
    resources :categories, except: [:new, :show]
  end

  scope module: :customers do
    resources :cart_items, except: [:new, :show, :edit]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  end

end
