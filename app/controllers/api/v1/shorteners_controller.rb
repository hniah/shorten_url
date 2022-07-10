# frozen_string_literal: true

module Api
  module V1
    class ShortenersController < BaseController
      def encode
        shorten_url = ShortenUrl.create!(original_url: url_param)
        render_json(data: ::V1::ShortenUrlSerializer.new(shorten_url))
      end

      def decode
        shorten_url = ShortenUrl.get_by_slug(slug_param)
        raise ApiError::NotFound if shorten_url.nil?

        render_json(data: ::V1::ShortenUrlSerializer.new(shorten_url))
      end

      private

      def url_param
        params.require(:url)
      end

      def slug_param
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
end
