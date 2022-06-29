Rails.application.routes.draw do
  get 'pages/homepage'
  get 'pages/about_us'
  root :to => "pages#homepage"
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

  resources :collabs do
    resources :donations do
      collection do
        post :derma
      end
    end
  end

  resources :events do
    resources :participants
    resources :results
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end