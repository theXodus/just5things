Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :users, only: :show

  root to: "welcome#index"
end
