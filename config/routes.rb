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
    resources :categories, except: [:new, :show]
    resources :orders,only: [:index, :show, :update]
  end

<<<<<<< HEAD

end 
=======
  scope module: :customers do
    resources :cart_items, except: [:new, :show, :edit]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  end

end
>>>>>>> origin/develop
