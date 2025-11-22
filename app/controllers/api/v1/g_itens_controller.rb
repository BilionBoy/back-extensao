# frozen_string_literal: true

module Api
  module V1
    class GItensController < ApplicationController
      include JsonResponse
      include PagyPagination

      before_action :set_g_item, only: [ :show, :update, :destroy ]

      # GET /g_itens
      def index
        query = GItem.ransack(params[:q])

        result = paginate(
          query.result.order(:id),
          params[:per_page],
          serializer: GItemSerializer
        )

        render_success(
          data: result,
          message: "GItens listados com sucesso"
        )
      end

      # GET /g_itens/:id
      def show
        render json: @g_item
      end

      # POST /g_itens
      def create
        @g_item = GItem.new(g_item_params)

        if @g_item.save
          render json: @g_item, status: :created
        else
          render json: @g_item.errors, status: :unprocessable_entity
        end
      end

      # PUT /g_itens/:id
      def update
        if @g_item.update(g_item_params)
          render json: @g_item
        else
          render json: @g_item.errors, status: :unprocessable_entity
        end
      end

      # DELETE /g_itens/:id
      def destroy
        @g_item.destroy
        head :no_content
      end

      private

      def set_g_item
        @g_item = GItem.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Not found" }, status: :not_found
      end

      def g_item_params
        params.require(:g_item)
              .permit(:descricao, :valor_diaria, :valor_semanal, :valor_mensal, :ativo)
      end
    end
  end
end
