Rails.application.routes.draw do
      resources :users, only: [:new, :create] do
        root 'questions#index'
          resources :questions do
            resources :answers do
              resource :session, only: :create
        end
      end
    end
    root 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
