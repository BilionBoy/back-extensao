Rails.application.routes.draw do
 root to: "rails/health#show"

  # opcional: manter a rota /up
  get "up" => "rails/health#show", as: :rails_health_check

  # Auth
  post "/register", to: "auth#register"
  post "/login", to: "auth#login"
end
