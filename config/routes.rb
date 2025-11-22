Rails.application.routes.draw do
  get "/health", to: proc { [ 200, {}, [ "OK" ] ] }

  namespace :api do
    namespace :v1 do
      resources :g_bairros
      resources :g_formas_pagamento
      resources :g_status_pagamentos
      resources :g_clientes
      resources :g_itens
      resources :g_contratos
      post "/login", to: "auth#login"
      get "/dashboard", to: "dashboard#index"
    end
  end
end
