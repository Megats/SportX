Rails.application.routes.draw do
<<<<<<< HEAD
  draw :admin
  draw :user
=======
  resources :events
  devise_for :admins
  devise_for :users
  root "dashboard#index"
  get 'dashboard/index'
  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  registrations: 'admins/registrations',
  # confirmations: 'admins/confirmations'
}
  devise_for :users, controllers: {sessions: 'users/sessions'}
>>>>>>> 22e901a71801f022c1344c694460be207ca4a5df
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end