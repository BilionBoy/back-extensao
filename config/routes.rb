Rails.application.routes.draw do
  get "/health", to: proc { [ 200, {}, [ "OK" ] ] }

  # rotas existentes
  post "/register", to: "auth#register"
  post "/login", to: "auth#login"
end
