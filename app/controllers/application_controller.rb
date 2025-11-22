class ApplicationController < ActionController::API
  include JsonResponse

  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers["Authorization"]
    token = header&.split&.last

    begin
      decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
      @current_user = User.find(decoded["user_id"])
    rescue
      render_error(message: "Não autorizado", status: :unauthorized)
    end
  end
end
