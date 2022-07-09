# frozen_string_literal: true

require 'rails_helper'

describe Api::ShortenersController, type: :controller do
  before do
    request.headers['Content-Type'] = 'application/json'
  end

  describe '#encode' do
    def do_request(url)
      post :encode, params: { url: url }
    end

    context 'With a valid url' do
      let(:original_url) { Faker::Internet.url }

      it 'is success' do
        do_request(original_url)
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq 0
        expect(result[:data][:original_url]).to eq original_url
        expect(result[:data][:short_url]).not_to be be_empty
      end
    end

    context 'With a invalid url' do
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
      post :decode, params: { url: url }
    end

    context 'With a valid url' do
      let(:url) { shorten_url.short_url }

      it 'is success' do
        do_request(url)
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq 0
        expect(result[:data][:original_url]).to eq shorten_url.original_url
      end
    end

    context 'With a invalid url' do
      it 'is failure' do
        do_request('invalid_url')
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).not_to be 0
      end
    end
  end
end
