module Response
  def render_data(data, code = nil)
    response_body = {
      code: code,
      data: data
    }

    render json: response_body
  end

  def render_error exception, code
    render json: ErrorSerializer.new(exception), status: code
  end
end