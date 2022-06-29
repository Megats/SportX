Rails.application.routes.draw do
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