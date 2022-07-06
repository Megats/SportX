Rails.application.routes.draw do
  get 'pages/homepage'
  get 'pages/about_us'
  get 'pages/terms_and_condition'
  get 'contacts/success_sent'
  root :to => "pages#homepage"
  resources :dashboards
  resources :contacts, only: [:new, :create]

  resources :participants
  resources :search

  resource :onboarding
  resources :results
  resources :payments do
    collection do
      post :payredirect
    end
  end
  resources :donationpayments do
    collection do
      post :donationredirect
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
    resources :donations do
      get :successful
      get :unsuccessful
    end
  end

  resources :events do
    resources :participants
    resources :results
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end