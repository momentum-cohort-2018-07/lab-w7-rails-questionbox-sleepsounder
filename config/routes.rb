Rails.application.routes.draw do
  
  

  resources :users
  resource :session, only: [:new, :create, :destroy]
  

    resources :questions, except: [:update, :edit]  do
      resources :answers
    end
    root 'questions#index'
    
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end