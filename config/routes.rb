Rails.application.routes.draw do

  resources :categories
  resources :reservations
  resources :eateries
  devise_for :users
  resources :users do
    collection do
      post 'test'
    end
  end

  #put "test" => "users#test"

  root "eateries#index"



  get "about" => "pages#about"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
