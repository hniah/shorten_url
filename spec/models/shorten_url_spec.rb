# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenUrl, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_length_of(:original_url).is_at_least(15).is_at_most(2048) }
  end

  describe 'get_by_slug' do
    let(:shorten_url) { create :shorten_url }

    it 'returns active_record' do
      record = described_class.get_by_slug(shorten_url.slug)
      expect(record).not_to be_nil
    end
  end
end
