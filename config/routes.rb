Rails.application.routes.draw do
  
  draw :admin
  draw :user

  resources :donations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end