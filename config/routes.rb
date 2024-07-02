Rails.application.routes.draw do
  resources :usuarios, except: [:new]

  resources :clientes

  resources :contatos
  resources :tipo_contatos, only: [:create]
  resources :meio_contatos, only: [:create]

  resources :atendimentos
  resources :meio_pagamentos, only: [:create]
  resources :tecnologia_links, only: [:create]
  resources :equipamentos, only: [:create]

  resources :fornecedors

  resources :sites
  resources :tipo_links, only: [:create]
  resources :municipios, only: [:create]
  resources :ufs, only: [:create]

  resources :statuses

  resources :faturas
  resources :boletos
  resources :local_pagamentos, only: [:create]

  resources :grupos

  get '/cadastrar', to: 'usuarios#new', as: 'new_usuario'

  root 'usuarios#entrar'
  get '/dashboard', to: 'dashboard#show'

  # get '/visao_geral_conta', to: 'usuarios#show', as: 'visao_geral_conta'
  # delete '/usuarios', to: 'usuarios#destroy', as: 'fechar_conta'

  get '/entrar', to: 'usuarios#entrar'
  post '/login', to: 'usuarios#login'
  get '/sair', to: 'usuarios#logout'
end
