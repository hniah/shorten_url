# frozen_string_literal: true

class ShortenUrl < ApplicationRecord
  self.primary_key = :slug
  list_partition_by :part

  ALPHA_NUMBER = [*('a'..'z'), *('A'..'Z'), *('0'..'9')].freeze
  SLUG_LENGTH = 6.freeze

  validates :original_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates_length_of :original_url, maximum: 500, on: :create, message: "url too long"

  before_create :generate_slug

  def short_url
    Rails.application.routes.url_helpers.short_url(slug: slug)
  end

  def self.find_by_slug(key)
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
    self.class.where(part: slug_part, slug: self.slug).exists?
  end

  def slug_part
    self.slug.chars[0].downcase
  end
end

