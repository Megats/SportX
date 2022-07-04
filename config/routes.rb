Rails.application.routes.draw do
  get 'pages/homepage'
  get 'pages/about_us'
  get 'contacts/success_sent'
  root :to => "pages#homepage"
  resources :dashboards
  resources :contacts, only: [:new, :create]

  resource :onboarding
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
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end