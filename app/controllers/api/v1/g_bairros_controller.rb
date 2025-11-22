# frozen_string_literal: true

module Api
  module V1
    class GBairrosController < ApplicationController
      include JsonResponse
      include PagyPagination
      before_action :set_g_bairro, only: [:show, :update, :destroy]

      # GET /g_bairros
      def index
        query  = GBairro.ransack(params[:q])
        result = paginate(query.result.order(:id), params[:per_page])

        render_success(
          data: result,
          message: "GBairros listados com sucesso"
        )
      end

      # GET /g_bairros/:id
      def show
        render json: @g_bairro
      end

      # POST /g_bairros
      def create
        @g_bairro = GBairro.new(g_bairro_params)

        if @g_bairro.save
          render json: @g_bairro, status: :created
        else
          render json: @g_bairro.errors, status: :unprocessable_entity
        end
      end

      # PUT /g_bairros/:id
      def update
        if @g_bairro.update(g_bairro_params)
          render json: @g_bairro
        else
          render json: @g_bairro.errors, status: :unprocessable_entity
        end
      end

      # DELETE /g_bairros/:id
      def destroy
        @g_bairro.destroy
        head :no_content
      end

      private

      def set_g_bairro
        @g_bairro = GBairro.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Not found" }, status: :not_found
      end

      def g_bairro_params
        params.require(:g_bairro)
              .permit(:descricao)
      end
    end
  end
end
