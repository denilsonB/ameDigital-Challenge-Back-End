Rails.application.routes.draw do
  resources :planets
  get '/search', to: "planets#search"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
