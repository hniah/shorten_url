# frozen_string_literal: true

module ApiError
  class Exception < StandardError
    attr_reader :message, :error_code

    def initialize(error_code, message)
      super(nil)
      @error_code = error_code
      @message = message
    end
  end

  I18n.t('api.errors').each do |key, val|
    ApiError.const_set(key.to_s.classify, Exception.new(val[:code], val[:message]))
  end
end
