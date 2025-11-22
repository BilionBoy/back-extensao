# frozen_string_literal: true

module Api
  module V1
    class GFormasPagamentoController < ApplicationController
      include JsonResponse
      include PagyPagination
      before_action :set_g_forma_pagamento, only: [ :show, :update, :destroy ]

      # GET /g_formas_pagamento
      def index
        query  = GFormaPagamento.ransack(params[:q])
        result = paginate(query.result.order(:id), params[:per_page])

        render_success(
          data: result,
          message: "GFormaPagamentos listados com sucesso"
        )
      end

      # GET /g_formas_pagamento/:id
      def show
        render json: @g_forma_pagamento
      end

      # POST /g_formas_pagamento
      def create
        @g_forma_pagamento = GFormaPagamento.new(g_forma_pagamento_params)

        if @g_forma_pagamento.save
          render json: @g_forma_pagamento, status: :created
        else
          render json: @g_forma_pagamento.errors, status: :unprocessable_entity
        end
      end

      # PUT /g_formas_pagamento/:id
      def update
        if @g_forma_pagamento.update(g_forma_pagamento_params)
          render json: @g_forma_pagamento
        else
          render json: @g_forma_pagamento.errors, status: :unprocessable_entity
        end
      end

      # DELETE /g_formas_pagamento/:id
      def destroy
        @g_forma_pagamento.destroy
        head :no_content
      end

      private

      def set_g_forma_pagamento
        @g_forma_pagamento = GFormaPagamento.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Not found" }, status: :not_found
      end

      def g_forma_pagamento_params
        params.require(:g_forma_pagamento)
              .permit(:descricao)
      end
    end
  end
end
