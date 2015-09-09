class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::Serialization

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :authenticate
  # run authenticate before you run any action

  private

  attr_reader :current_photographer

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      @current_photographer = Photographer.find_by token: token
    end
  end

  def record_not_found
    render json: { message: 'Not Found' }, status: :not_found
  end
end
