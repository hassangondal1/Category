Rails.application.routes.draw do


  root to: "main#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

get 'program/new', to: 'program#new' , as: "new_program"
post 'program/new', to: 'program#create'
get 'program/show', to: 'program#show' , as: "show_program"
get 'program/detail.:id', to: 'program#detail' , as: "detail_program"
get 'program/add_program_user', to: 'program#add_program_user' , as: "add_program_user"
post 'program/add_program_user', to: 'program#add_program_user_create' 



get 'organization/new', to: 'organization#new' , as: "new_organization"
post 'organization/new', to: 'organization#create'
get 'organization/show', to: 'organization#show' , as: "show_organization"
get 'organization/detail.:id', to: 'organization#detail' , as: "detail_organization"



end
