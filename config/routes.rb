Rails.application.routes.draw do
  root to: "stocks#index"
  resources :stocks, only: [:index, :show, :create, :update, :destroy] do
    member do
      get :recover
    end
  end
end
