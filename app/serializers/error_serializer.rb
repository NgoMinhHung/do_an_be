class ErrorSerializer
  def initialize(message, code = 0)
    @code = code
    @message = message 
  end
end
