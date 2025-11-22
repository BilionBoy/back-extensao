Rails.application.routes.draw do
  get "/health", to: proc { [ 200, {}, [ "OK" ] ] }

  namespace :api do
    namespace :v1 do
      resources :g_bairros
      post "/login", to: "auth#login"
    end
  end
end
