class ApplicationController < ActionController::API
  include ActionController::Cookies
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_response

  before_action :authorize
  

  private

  def authorize
    @user = User.find_by(id: session[:user_id])
    render json: {errors: ["Not Authorized"]}, status: :unauthorized unless @user
  end

  def unprocessable_response(invalid)

    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity

  end 

end
