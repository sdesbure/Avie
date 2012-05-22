Avie::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => "registrations" }
  get 'users/:id/show_all_positions' => "users#show", :as => :show_all_positions_user
  resources :users, :only => [:show, :index]
  resources :insurers
  resources :brokers
  resources :life_insurances
  get 'life_insurance_contracts/:id/show_all_positions' => "life_insurance_contracts#show", :as => :show_all_positions_life_insurance_contract
  resources :life_insurance_contracts
  get 'positions/new_on_euro_fund' => "positions#new_on_euro_fund", :as => :position_new_on_euro_fund
  get 'positions/new_on_account_unit' => "positions#new_on_account_unit", :as => :position_new_on_account_unit
  resources :positions
  get 'account_units/:id/show_all_positions' => "account_units#show", :as => :show_all_positions_account_unit
  resources :account_units do
    resources :positions
  end
  get 'euro_funds/:id/show_all_positions' => "euro_funds#show", :as => :show_all_positions_euro_fund
  resources :euro_funds do
    resources :positions
  end
end
