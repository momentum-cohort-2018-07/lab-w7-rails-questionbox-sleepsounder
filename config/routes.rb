Rails.application.routes.draw do
      root 'questions#index'
        resources :users do
          resources :questions do
            resources :answers do
              resource :session, only: :create
        end
      end
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end