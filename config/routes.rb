Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "status#index"

  jsonapi_resources :authors
  jsonapi_resources :books
end
