Rails.application.routes.draw do
  resources :users
  resources :blogs do
    collection do
      post :confirm
    end
  end
end