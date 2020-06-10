Rails.application.routes.draw do
  
  
 
 
 

  devise_for :users

  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resource :goods, only: [:create, :destroy]
    resource :bads, only: [:create, :destroy]
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  root 'tweets#index'
  
end


