Rails.application.routes.draw do
  root to: "quotes#index"
  resources :quotes, only: [:index, :show] do
    resources :ratings, only: [:new, :create]
  end
end
