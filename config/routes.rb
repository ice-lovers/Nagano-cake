Rails.application.routes.draw do
  
  
    resources :categories, except: [:new, :show]
  
  
end
