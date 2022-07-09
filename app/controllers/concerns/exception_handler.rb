# frozen_string_literal: true

module ExceptionHandler
  def listening_exception  # rubocop:todo Metrics/MethodLength
    yield
  rescue ActiveRecord::RecordNotFound
    response_error(404, 'Not Found')
  rescue ActiveRecord::RecordInvalid => e
    response_error(422, e.message)
  rescue StandardError => e
    if e.class.name.include? 'ApiError::Exception'
      response_error(e.error_code, e.message)
    else
      response_error(500, e.message)
    end
  end

  private

  def response_error(code, message)
    render json: { error_code: code, message: message.sub('Validation failed: ', '') }, status: :ok
  end
end
