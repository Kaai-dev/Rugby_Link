Rails.application.routes.draw do
  devise_for :admins
  root "players#index"
  resources :absences
  resources :players do
    resources :absences
    member do
      delete "delete_profile_pic"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
