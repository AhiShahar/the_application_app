Rails.application.routes.draw do


  root 'pages#home'
  get '/home' => 'pages#home'

  get "/search" => 'appointment_types#search'

  get "/users/edit" => 'users#edit', :as => 'edit_user'
  get "/users/unapproved" => 'users#unapproved', :as => "unapproved"
  get "/users/:id/new_relation" => 'users#new_relation', :as => "new_relation"
  get "/users/:id/approve_relation" => "users#approve_relation", :as => 'approve_relation'

  resources :users, :except => [:edit]

  resources :appointments
  resources :appointment_types

  get "/login" => 'session#new', :as => 'login'
  post "/login" => 'session#create'
  delete "/login" => 'session#destroy'


end
