Rails.application.routes.draw do
  devise_for :admins
  root "players#index"
  resources :absences
  resources :players do
    resources :absences
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
