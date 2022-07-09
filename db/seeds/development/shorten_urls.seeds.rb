ActiveRecord::Base.connection.execute("TRUNCATE shorten_urls RESTART IDENTITY CASCADE")
puts "==== Create ShortUrls ===="
ShortenUrl.transaction do
  (1..1000).each do |i|
    ShortenUrl.create(original_url: Faker::Internet.url)
  end
end
puts "==== End ===="
