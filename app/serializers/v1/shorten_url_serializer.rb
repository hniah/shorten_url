# frozen_string_literal: true

module V1
  class ShortenUrlSerializer < ActiveModel::Serializer
    attributes :original_url, :short_url
  end
end
