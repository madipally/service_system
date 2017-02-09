Rails.application.routes.draw do
  
  get 'tickets/edit'

  get 'tickets/destroy'
  #root path
  root 'sessions#new'
  
  get 'create_staffusers' => 'staff_users#new'
  #signup
  get 'signup' =>'end_users#new'
  #login
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  #logout
  delete 'logout' => 'sessions#destroy'
  #tickets
  get 'create_ticket' => 'tickets#new'
  post '/tickets' => 'tickets#create'
  get '/tickets' => 'tickets#index'
  post '/update_ticket' => 'tickets#update_ticket'
  post '/update_assignee' => 'tickets#update_assignee'
  
  resources :users
  resources :staff_users
  resources :end_users
  resources :admin_users
end
