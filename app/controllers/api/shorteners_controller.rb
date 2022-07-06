module Api
  class ShortenersController < BaseController
    def encode
      shorten_url = ShortenUrl.create!(original_url: url_param)
      render_json(data: ShortenUrlSerializer.new(shorten_url))
    end

    def decode
      regexp = Regexp.new("^#{request.base_url}/(\\w+)")
      result = url_param.match(regexp)
      raise ApiError::NotFound if result.nil?

      shorten_url = ShortenUrl.find_by_slug!(result[1])
      render_json(data: ShortenUrlSerializer.new(shorten_url))
    end

    private

    def url_param
      params.require(:url)
    end
  end
end