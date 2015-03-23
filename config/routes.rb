Rails.application.routes.draw do
  root :to => 'users#index'
  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out

  resources :users do
    resources :questions
    resources :comments
  end
  resources :questions do
    resources :comments
  end
end
