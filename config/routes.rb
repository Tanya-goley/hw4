Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })

  resources :places do
    resources :entries
  end

  resources :sessions
  resources :users

  get "/signup", to: "users#new" # Signup page
  get "/login", to: "sessions#new" # Login page
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy" # Logout option
end
