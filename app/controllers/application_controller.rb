class ApplicationController < ActionController::API
  include ActionController::Cookies

  private

  def record_not_found_message(invalid)
    render json: {"error": "#{invalid.message.split(" ")[2]} not found"}, status: :not_found
  end

  def record_unprocessable_message
    render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
  end

end
