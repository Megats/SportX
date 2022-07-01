Rails.application.routes.draw do
  get 'pages/homepage'
  get 'pages/about_us'
  root :to => "pages#homepage"
  resources :dashboards

  resource :onboarding
  resource :onboarding_step
  resources :results
  resources :payments do
    collection do
      post :payredirect
    end
  end
  resources :events do
    resources :onboard_payments do
      get :register
    end
    resources :participants
    resources :results
  end

  draw :user
  draw :admin

  resources :collabs do
    resources :donations
  end

  resources :events do
    resources :participants
    resources :results
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end