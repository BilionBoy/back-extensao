module Api
  module V1
    class AuthController < ApplicationController
            skip_before_action :authenticate_request!, only: [ :login ]

      def login
        user = find_user

        unless user&.authenticate(login_params[:password])
          return render json: { error: "Credenciais inválidas" }, status: :unauthorized
        end

        token = encode_token(user_id: user.id)

        render json: {
          message: "Login realizado com sucesso",
          user: user,
          access_token: token
        }, status: :ok
      end

      private

      def login_params
        params.require(:auth).permit(:cpf, :email, :password)
      end

      def find_user
        if login_params[:cpf].present?
          User.find_by(cpf: login_params[:cpf].gsub(/\D/, ""))
        elsif login_params[:email].present?
          User.find_by(email: login_params[:email].downcase)
        end
      end
    end
  end
end
