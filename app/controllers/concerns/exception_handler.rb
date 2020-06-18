module ExceptionHandler
  extend ActiveSupport::Concern
  include Response

  class AuthenticationError < StandardError; end
  
  class BadRequestError < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found 
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid 
    rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    rescue_from BadRequestError, with: :bad_request_error
    rescue_from AuthenticationError, with: :authentication_error
  end

  def record_not_found exception
    render_error(exception, 404)
  end

  def record_invalid exception
    render_error(exception, 422)
  end

  def record_not_unique exception 
    render_error(exception, 422)
  end

  def parameter_missing exception 
    render_error(exception, 400)
  end

  def bad_request_error exception
    render_error(exception,400)
  end 
end