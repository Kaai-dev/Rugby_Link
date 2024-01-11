Rails.application.routes.draw do
  resources :teams
  resources :coaches
  resources :user_settings

  devise_for :users

  root "players#index"


  resources :users do
    collection do
      get "flash_back_to_index"
    end

    member do
      get "flash_cancel_edit"
      get "delete_user_profile_pic"
    end
  end

  resources :coaches do
    collection do
      get "flash_back_to_index"
    end

    member do
      get "flash_cancel_edit"
      get "delete_coach_profile_pic"
    end
  end

  resources :players do

    collection do
      get "flash_back_to_index"
    end  
      
    member do
      get "flash_cancel_edit"
      get "delete_player_profile_pic"
    end
  end

  resources :user_settings do
    member do
      patch "dark_mode_route"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
