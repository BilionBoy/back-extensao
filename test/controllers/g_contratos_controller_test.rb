require "test_helper"

class GContratosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @g_contrato = g_contratos(:one)
  end

  test "should get index" do
    get g_contratos_url, as: :json
    assert_response :success
  end

  test "should create g_contrato" do
    assert_difference("GContrato.count") do
      post g_contratos_url, params: { g_contrato: { data_devolucao: @g_contrato.data_devolucao, data_entrega: @g_contrato.data_entrega, g_cliente_id: @g_contrato.g_cliente_id, g_forma_pagamento_id: @g_contrato.g_forma_pagamento_id, g_status_pagamento_id: @g_contrato.g_status_pagamento_id, observacoes: @g_contrato.observacoes } }, as: :json
    end

    assert_response :created
  end

  test "should show g_contrato" do
    get g_contrato_url(@g_contrato), as: :json
    assert_response :success
  end

  test "should update g_contrato" do
    patch g_contrato_url(@g_contrato), params: { g_contrato: { data_devolucao: @g_contrato.data_devolucao, data_entrega: @g_contrato.data_entrega, g_cliente_id: @g_contrato.g_cliente_id, g_forma_pagamento_id: @g_contrato.g_forma_pagamento_id, g_status_pagamento_id: @g_contrato.g_status_pagamento_id, observacoes: @g_contrato.observacoes } }, as: :json
    assert_response :success
  end

  test "should destroy g_contrato" do
    assert_difference("GContrato.count", -1) do
      delete g_contrato_url(@g_contrato), as: :json
    end

    assert_response :no_content
  end
end
