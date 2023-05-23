Rails.application.routes.draw do
  devise_for :users
  resources :records
  resources :categories
  get "/", to: "records#index", as: "root"
  get "/new_record/:id", to:"records#new_record", as: "create_record"
end
