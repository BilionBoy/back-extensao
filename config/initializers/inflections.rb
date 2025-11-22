ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular "user",                "users"
  inflect.irregular "g_bairro",            "g_bairros"
  inflect.irregular "g_forma_pagamento",   "g_formas_pagamento"
  inflect.irregular "g_status_pagamento",  "g_status_pagamentos"
  inflect.irregular "g_cliente",           "g_clientes"
  inflect.irregular "g_item",              "g_itens"
  inflect.irregular "g_contrato",          "g_contratos"
  inflect.irregular "g_contrato_item",     "g_contrato_itens"
end
