Rails.application.routes.draw do
  
  root :to => "home#index"
  resources :currencies
  post 'calculate_invest', to: 'home#calculate_invest'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
