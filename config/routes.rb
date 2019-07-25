Rails.application.routes.draw do
  resources :authors

  root "authors#sign_up"

  resources :authors do
  	resources :departments
  	resources :books
  end
  
end