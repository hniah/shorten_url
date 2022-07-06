class ShortenUrl < ApplicationRecord
  ALPHA_NUMBER = ([*("a".."z"),*("A".."Z"),*("0".."9")]).freeze

  validates :original_url, presence: true, format: URI::regexp(%w[http https])
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug

  private

  def generate_slug
    self.slug = ALPHA_NUMBER.sample(6).join if slug.blank?
  end
end