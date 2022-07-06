module Api
  class ShortenersController < BaseController
    def encode
      shorten_url = ShortenUrl.create!(original_url: url_param)
      render_json(data: ShortenUrlSerializer.new(shorten_url))
    end

    def decode
      shorten_url = ShortenUrl.find_by_slug!(parse_slug)
      render_json(data: ShortenUrlSerializer.new(shorten_url))
    end

    private

    def url_param
      params.require(:url)
    end

    def parse_slug
      regexp = Regexp.new("^#{host_url}/(\\w+)")
      result = url_param.match(regexp)
      raise ApiError::InvalidShortenUrl if result.nil?
      result[1]
    end

    def host_url
      Rails.application.routes.default_url_options[:host]
    end
  end
end