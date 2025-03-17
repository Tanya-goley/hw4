Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"
  get "/signup", to: "users#new" #for the signup page
  get "/login", to: "sessions#new" #for the login page
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy" #for the logout option
end
