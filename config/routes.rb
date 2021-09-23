Rails.application.routes.draw do
    resources :products do
        scope module: :product do
            resources :bids
        end
    end
    resources :myitems



    devise_for :users
    devise_scope :user do
        get '/users/sign_out' => 'devise/sessions#destroy'
    end
    
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: "home#index"
end
