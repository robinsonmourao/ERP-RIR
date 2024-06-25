Rails.application.routes.draw do
  resources :usuarios

  resources :clientes

  resources :contatos
  resources :tipo_contatos, only: [:create]
  resources :meio_contatos, only: [:create]

  resources :atendimentos
  resources :meio_pagamentos, only: [:create]
  resources :tecnologia_links, only: [:create]
  resources :equipamentos, only: [:create]

  resources :fornecedores, except: [:new, :edit, :show, :update, :destroy]

  get '/fornecedores/new', to: 'fornecedores#new', as: 'new_fornecedor'
  get '/fornecedores/:id/edit', to: 'fornecedores#edit', as: 'edit_fornecedor'
  get '/fornecedores/:id', to: 'fornecedores#show', as: 'fornecedor'

  patch '/fornecedores/:id', to: 'fornecedores#update'
  put '/fornecedores/:id', to: 'fornecedores#update'
  delete '/fornecedores/:id', to: 'fornecedores#destroy'

  resources :sites
  resources :tipo_links, only: [:create]
  resources :municipios, only: [:create]
  resources :ufs, only: [:create]

  resources :statuses

  resources :faturas
  resources :boletos
  resources :local_pagamentos, only: [:create]

  resources :grupos

  root 'usuarios#entrar'
  get '/dashboard', to: 'dashboard#show'

  get '/entrar', to: 'usuarios#entrar'
  post '/login', to: 'usuarios#login'
  get '/sair', to: 'usuarios#logout'
end
