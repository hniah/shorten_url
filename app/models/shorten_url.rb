# frozen_string_literal: true

class ShortenUrl < ApplicationRecord
  ALPHA_NUMBER = [*('a'..'z'), *('A'..'Z'), *('0'..'9')].freeze
  SLUG_LENGTH = 6.freeze

  validates :original_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates_length_of :original_url, maximum: 500, on: :create, message: "url too long"

  before_create :generate_slug

  def short_url
    Rails.application.routes.url_helpers.short_url(slug: slug)
  end

  private

  def generate_slug
    self.slug = ALPHA_NUMBER.sample(SLUG_LENGTH).join
    generate_slug if slug_existed?
  end

  def slug_existed?
    self.class.where(slug: self.slug).exists?
  end
end


