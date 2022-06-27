devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations',
  confirmations: 'users/confirmations'
}

devise_scope :user do
  authenticated :user do
    root 'users/dashboards#index', as: :authenticated_user_root
  end

  unauthenticated :user do
    root 'users/sessions#new', as: :unauthenticated_user_root
  end
end

namespace :users, as: :user do
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
    
  end

end