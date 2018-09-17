Rails.application.routes.draw do
  
  

  resources :users
  resource :session, only: [:new, :create, :destroy]
  

    resources :questions, except: [:update, :edit]  do
      resources :answers
    end
    root 'questions#index'
    
  namespace :api do 
    resource :session, only: [:create]
    get 'index', to: 'users#index'
    resources :users, only: [:index, :create, :update, :show, :destroy]
    resources :questions, except: [:new, :update, :edit] do 
      resources :answers, except: [:new, :edit]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end