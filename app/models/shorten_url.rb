# frozen_string_literal: true

class ShortenUrl < ApplicationRecord
  self.primary_key = :slug
  list_partition_by :part

  ALPHA_NUMBER = [*('a'..'z'), *('A'..'Z'), *('0'..'9')].freeze
  SLUG_LENGTH = 6

  validates :original_url, length: { minimum: 15, maximum: 2048 },
                           format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

  before_create :generate_slug

  def short_url
    Rails.application.routes.url_helpers.short_url(slug: slug)
  end

  def self.get_by_slug(key)
    return nil if key.blank?

    where(part: key.chars[0].downcase).find_by(slug: key)
  end

  private

  def generate_slug
    self.slug = ALPHA_NUMBER.sample(SLUG_LENGTH).join
    self.part = slug_part
    generate_slug if slug_existed?
  end

  def slug_existed?
    self.class.exists?(part: slug_part, slug: slug)
  end

  def slug_part
    slug.chars[0].downcase
  end
end
