Rails.application.routes.draw do
  get 'items/create'

  devise_for :users do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :users do
    resources :items, only: :create
  end

  root to: "welcome#index"
end
