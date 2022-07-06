require 'rails_helper'

RSpec.describe ShortenUrl, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:original_url) }
    it { is_expected.to validate_uniqueness_of(:slug) }
  end
end
