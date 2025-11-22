class AuthController < ApplicationController
  skip_before_action :authenticate_request, only: [ :login, :register ]

  def register
    user = User.new(user_params)

    if user.save
      render_success(
        message: "Usuário criado com sucesso",
        data: user
      )
    else
      render_error(
        message: "Erro ao criar usuário",
        errors: user.errors.full_messages
      )
    end
  end

  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)

      render_success(
        message: "Login realizado com sucesso",
        data: { token: token }
      )
    else
      render_error(
        message: "Email ou senha inválidos",
        status: :unauthorized
      )
    end
  end

  private

  def user_params
    params.permit(:nome, :cpf, :email, :password, :password_confirmation)
  end

  def jwt_encode(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end
end
