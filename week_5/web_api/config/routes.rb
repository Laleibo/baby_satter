Rails.application.routes.draw do

resources :owners do
  resources :pets
end
  # get 'pet/index'
  #
  # get 'pet/new'
  #
  # get 'pet/create'
  #
  # get 'pet/show'

  root 'owners#new'


  #
  post '/pets/:owner_id' => 'pet#create'
  #
  # post '/owner/create' => 'owner#create', as: "owners"
  # get 'show/:id' => 'owner#show', as: "owner"
end
