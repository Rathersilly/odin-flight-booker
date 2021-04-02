Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :airports, :flights
  resources :bookings, :passengers

  root 'flights#index'
  get '/test_email', to: 'passengers#test_email'
end
