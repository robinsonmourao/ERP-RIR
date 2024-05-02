Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'usuario#new'

  resources :usuario

  get 'entrar', to: 'usuario#entrar'
  post 'login', to: 'usuario#login'

  get 'sair', to: 'usuario#logout'
  post 'usuarios', to: 'usuario#create'

  get 'dashboard', to: 'dashboard#show'
end
