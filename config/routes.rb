Rails.application.routes.draw do
  get 'items/create'

  resources :users do
    resources :items, only: :create
  end

  devise_for :users do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  root to: "welcome#index"
end
