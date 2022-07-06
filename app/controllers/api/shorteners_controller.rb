module Api
  class ShortenersController < BaseController
    def encode
      shorten_url = ShortenUrl.create!(original_url: url_param)
      render_json(data: ShortenUrlSerializer.new(shorten_url))
    end

    def decode
    end

    private

    def url_param
      params.require(:url)
    end
  end
end