# frozen_string_literal: true

FactoryBot.define do
  factory :shorten_url do
    original_url { 'https://guides.rubyonrails.org/active_record_basics.html#the-active-record-pattern' }
  end
end
