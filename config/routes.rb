Rails.application.routes.draw do
  # Health check
  get "/health", to: proc { [ 200, {}, [ "OK" ] ] }

  # Namespace de autenticação
  scope "/auth" do
    post "/register", to: "auth#register"
    post "/login",    to: "auth#login"
  end
end
