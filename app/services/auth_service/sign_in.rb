module AuthService::SignIn
  def self.call(sign_in_params)
    account = Account.find_by(email: sign_in_params[:email])
    raise(ExceptionHandler::AuthenticationError, Message.email_not_found) unless account
    raise(ExceptionHandler::AuthenticationError, Message.incorrect_password) unless account.authenticate(sign_in_params[:password])
    token, expired_time = UtilService::TokenGenerator.call(account)
    return token, expired_time, account.user
  end
end