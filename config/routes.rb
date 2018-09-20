Rails.application.routes.draw do
  
  

  get 'reports/create'
  get 'reports/show'
  get 'reports/new'
  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :reports, only: [:new, :create, :show]
  

  resources :questions, except: [:update, :edit]  do
      resources :answers
  end
  root 'questions#index'
    
  namespace :api do 
    namespace :v1 do 
      resource :session, only: [:create]
      get 'index', to: 'users#index'
      get 'questions', to: 'questions#index'
      resources :users, only: [:index, :create, :update, :show, :destroy]
      resources :questions, except: [:new, :update, :edit] do 
        resources :answers, except: [:new, :edit]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end