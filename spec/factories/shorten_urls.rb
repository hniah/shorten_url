# frozen_string_literal: true

FactoryBot.define do
  factory :shorten_url do
    original_url { Faker::Internet.url }
  end
end
