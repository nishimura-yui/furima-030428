Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :orders, only:[:index, :create]
    member do
      get :confirm_destroy
    end
  end
end