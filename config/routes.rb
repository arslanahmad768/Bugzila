Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
    root "sessions#login"
    get "/user", to:"users#index"
    #users routes
    puts "start PROGRAM"
    resources:users, only:[:new,:create,:edit,:update,:show,:destroy]
    #session routes
    get "/login", to:"sessions#login"
    post "/login", to:"sessions#create"
    post "/logout", to:"sessions#destroy"
    get "/logout", to:"sessions#destroy"

    resources:projects

end
