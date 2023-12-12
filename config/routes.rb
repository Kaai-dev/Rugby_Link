Rails.application.routes.draw do

  devise_for :users
  devise_for :admins
  root "players#index"
  resources :absences
  resources :users
  resources :players do
    resources :absences
    member do
      get "delete_profile_pic"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
