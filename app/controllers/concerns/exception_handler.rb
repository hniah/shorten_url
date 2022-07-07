# frozen_string_literal: true

module ExceptionHandler
  def listening_exception
    yield
  rescue ActiveRecord::RecordNotFound => e
    response_error(e, 404, 'Not Found')
  rescue ActiveRecord::RecordInvalid => e
    response_error(e, 422, e.message)
  rescue StandardError => e
    if e.class.name.include? 'ApiError::Exception'
      response_error(e, e.error_code, e.message)
    else
      response_error(e, 500, e.message)
    end
  end

  private

  def response_error(exception, code, message)
    render json: { error_code: code, message: message.sub('Validation failed: ', '') }, status: :ok
  end
end
