# frozen_string_literal: true

module Api
  module V1
    class GBairrosController < ApplicationController
      before_action :set_g_bairro, only: [ :show, :update, :destroy ]

      def index
        @g_bairros = GBairro.all
        render json: @g_bairros
      end

      def show
        render json: @g_bairro
      end

      def create
        @g_bairro = GBairro.new(g_bairro_params)
        if @g_bairro.save
          render json: @g_bairro, status: :created
        else
          render json: @g_bairro.errors, status: :unprocessable_entity
        end
      end

      def update
        if @g_bairro.update(g_bairro_params)
          render json: @g_bairro
        else
          render json: @g_bairro.errors, status: :unprocessable_entity
        end
      end

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
        params.require(:g_bairro).permit(descricao)
      end
    end
  end
end
