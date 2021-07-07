Rails.application.routes.draw do
  # resources :users
  # resources :tasks do
  #   collection do
  #     post :confirm
  #   end
  # end
  root 'tasks#index'
  resources :tasks
end