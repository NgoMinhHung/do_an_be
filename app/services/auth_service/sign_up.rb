module AuthService::SignUp
  def self.call(sign_up_params)
    account = Account.find_by(email: sign_up_params[:email])
    raise(ExceptionHandler::BadRequestError, Message.email_is_existed) if account
    user = UserService::Create.call(sign_up_params)
    user
  end
end