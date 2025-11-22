class ApplicationController < ActionController::API
  before_action :authenticate_request!
  include Pagy::Backend
  # NÃO deixa esse método como private
  def authenticate_request!
    header = request.headers["Authorization"]
    token  = header&.split&.last

    decoded = decode_token(token)
    return render json: { error: "Não autorizado" }, status: :unauthorized unless decoded

    @current_user = User.find_by(id: decoded["user_id"])
  end

  private

  def jwt_secret
    Rails.application.secret_key_base
  end

  def encode_token(payload)
    JWT.encode(payload.merge(exp: 24.hours.from_now.to_i), jwt_secret)
  end

  def decode_token(token)
    JWT.decode(token, jwt_secret, true, algorithm: "HS256")[0]
  rescue
    nil
  end
end
