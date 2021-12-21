Rails.application.routes.draw do
  get 'reviews/create'
  get 'pages/home'
  devise_for :users
  resources :events do 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :reviews, only: %i[create]
      collection do
        get :top
      end
    end
  get "/dashboard", to: "dashboards#show", as: "dashboard"
  resources :users, only: [] do
    member do
      patch :chef
    end
  end
end
