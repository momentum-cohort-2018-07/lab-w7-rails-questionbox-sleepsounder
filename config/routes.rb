Rails.application.routes.draw do
    
  resources :users
  
  resource :session, only: [:new, :create, :destroy]
  
  root 'questions#index'
    resources :questions do
      resources :answers do
              
      
      end
    end
    
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end