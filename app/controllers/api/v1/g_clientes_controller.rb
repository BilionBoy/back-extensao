# frozen_string_literal: true

module Api
  module V1
    class GClientesController < ApplicationController
      include JsonResponse
      include PagyPagination
      before_action :set_g_cliente, only: [ :show, :update, :destroy ]

     # GET /g_clientes
     def index
      query = GCliente.includes(:g_bairro).ransack(params[:q])

      result = paginate(
        query.result.order(:id),
        params[:per_page],
        serializer: GClienteSerializer
      )

      render_success(
        data: result,
        message: "GClientes listados com sucesso"
      )
    end


      # GET /g_clientes/:id
      def show
        render json: @g_cliente
      end

      # POST /g_clientes
      def create
        @g_cliente = GCliente.new(g_cliente_params)

        if @g_cliente.save
          render json: @g_cliente, status: :created
        else
          render json: @g_cliente.errors, status: :unprocessable_entity
        end
      end

      # PUT /g_clientes/:id
      def update
        if @g_cliente.update(g_cliente_params)
          render json: @g_cliente
        else
          render json: @g_cliente.errors, status: :unprocessable_entity
        end
      end

      # DELETE /g_clientes/:id
      def destroy
        @g_cliente.destroy
        head :no_content
      end

      private

      def set_g_cliente
        @g_cliente = GCliente.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Not found" }, status: :not_found
      end

      def g_cliente_params
        params.require(:g_cliente)
              .permit(:nome, :telefone, :cpf, :rg, :data_nascimento, :endereco_residencial, :local_entrega, :g_bairro_id)
      end
    end
  end
end
