# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::ShortenersController, type: :controller do
  before do
    request.headers['Content-Type'] = 'application/json'
  end

  describe '#encode' do
    def do_request(url)
      post :encode, params: { url: url }
    end

    context 'with a valid url' do
      let(:url) { Faker::Internet.url }

      it 'is success' do
        do_request(url)
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq 0
      end
    end

    context 'with a invalid url' do
      it 'is failure' do
        do_request('invalid_url')
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).not_to be 0
      end
    end
  end

  describe '#decode' do
    let!(:shorten_url) { create :shorten_url }

    def do_request(url)
      get :decode, params: { url: url }
    end

    context 'with a valid url' do
      let(:url) { shorten_url.short_url }

      it 'returns matched shorten_url' do
        do_request(url)
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq 0
      end
    end

    context 'with a invalid url' do
      it 'is failure' do
        do_request('invalid_url')
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).not_to be 0
      end
    end
  end
end
