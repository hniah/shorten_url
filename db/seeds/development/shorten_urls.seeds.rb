# frozen_string_literal: true

ActiveRecord::Base.connection.execute('TRUNCATE shorten_urls RESTART IDENTITY CASCADE')
Rails.logger.debug '==== Create ShortUrls ===='
ShortenUrl.transaction do
  (1..10000).each do |_i|
    ShortenUrl.create(original_url: Faker::Internet.url)
  end
end
Rails.logger.debug '==== End ===='
