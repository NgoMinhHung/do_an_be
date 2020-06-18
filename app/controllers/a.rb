class A
  def initialize
    raise ExceptionHandler::BadRequestError, 'hello' 
  end
end