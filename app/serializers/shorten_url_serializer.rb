class ShortenUrlSerializer < ActiveModel::Serializer
  attributes :original_url, :short_url
end