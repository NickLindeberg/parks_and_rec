Rails.application.routes.draw do
  root to: "quotes#index"
  resources :quotes, only: [:index]
end
