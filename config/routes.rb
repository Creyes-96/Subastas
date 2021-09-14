Rails.application.routes.draw do

    resources :products do
        scope module: :product do
            resources :bids
        end
    end




    devise_for :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: "home#index"
end
