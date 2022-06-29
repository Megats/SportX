Rails.application.routes.draw do
  root :to => "dashboards#index"
  resources :dashboards
  resources :collabs do
    resources :donations
  end
  resources :results
  resources :payments
  resources :users
  resources :events do
    resources :participants
    resources :results
  end

  draw :user
  draw :admin


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end