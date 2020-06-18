module UtilService
  class JsonWebToken
    HMAC_SECRET = Rails.application.secrets.secret_key_base
  
    def self.encode(payload, exp = 6.months.from_now)
      payload[:exp] = exp.to_i  
      return JWT.encode(payload, HMAC_SECRET), exp
    end
  
    def self.decode(token)
      body = JWT.decode(token, HMAC_SECRET)[0]
      HashWithIndifferentAccess.new body
    rescue => exception
      raise ExceptionHandler::AuthenticationError, exception.message
    end
  end
end