Avie::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, :only => [:show, :index]
  resources :insurers
  resources :brokers
  resources :life_insurances
  resources :life_insurance_contracts
  resources :positions
  resources :acount_units
  resources :euro_funds
end
