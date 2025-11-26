# frozen_string_literal: true

puts "Limpando banco..."
GContratoItem.destroy_all
GContrato.destroy_all
GItem.destroy_all
GCliente.destroy_all
GBairro.destroy_all
GFormaPagamento.destroy_all
GStatusPagamento.destroy_all

puts "Criando bairros..."
bairro = GBairro.create!(descricao: "Centro")

puts "Criando cliente..."
cliente = GCliente.create!(
  nome: "João Silva",
  telefone: "11999999999",
  cpf: "11122233344",
  rg: "1234567",
  data_nascimento: "1990-01-01",
  endereco_residencial: "Rua A, 123",
  local_entrega: "Rua A, 123",
  g_bairro: bairro
)

puts "Criando status de pagamento..."
status_pago   = GStatusPagamento.create!(descricao: "Pago")
status_aberto = GStatusPagamento.create!(descricao: "Em aberto")

puts "Criando formas de pagamento..."
forma_pix  = GFormaPagamento.create!(descricao: "PIX")
forma_cart = GFormaPagamento.create!(descricao: "Cartão")
forma_bol  = GFormaPagamento.create!(descricao: "Boleto")

puts "Criando itens..."
item1 = GItem.create!(
  descricao: "Betoneira",
  valor_diaria: 50.00,
  valor_semanal: 300.00,
  valor_mensal: 1000.00,
  ativo: true
)

item2 = GItem.create!(
  descricao: "Andaime",
  valor_diaria: 30.00,
  valor_semanal: 180.00,
  valor_mensal: 600.00,
  ativo: true
)

item3 = GItem.create!(
  descricao: "Furadeira",
  valor_diaria: 20.00,
  valor_semanal: 120.00,
  valor_mensal: 400.00,
  ativo: true
)

puts "Criando contrato com 3 itens..."

contrato = GContrato.create!(
  data_entrega: Date.today,
  data_devolucao: Date.today + 3.days,
  observacoes: "Contrato de teste automático",
  g_cliente: cliente,
  g_status_pagamento: status_aberto,
  g_forma_pagamento: forma_pix
)

GContratoItem.create!(
  g_contrato: contrato,
  g_item: item1,
  quantidade: 2
)

GContratoItem.create!(
  g_contrato: contrato,
  g_item: item2,
  quantidade: 1
)

GContratoItem.create!(
  g_contrato: contrato,
  g_item: item3,
  quantidade: 3
)

puts "✅ Seed finalizado com sucesso!"
