Rails.application.routes.draw do
  root to: "stocks#index"
  resources :stocks, only: [:index, :show, :create, :update, :destroy]
end
