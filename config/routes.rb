Rails.application.routes.draw do
  root "twodos#index"
  resources :twodos
end
