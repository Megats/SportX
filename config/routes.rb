Rails.application.routes.draw do
  get 'pages/homepage'
  get 'pages/about_us'
  root :to => "dashboards#index"
  resources :dashboards
  resources :collabs do
    resources :donations
  end
  resources :results
  resources :payments
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