require "rails_helper"
RSpec.describe "Rack::Attack.throttle - req/ip/api/encode-tries", type: :request do
  include ActiveSupport::Testing::TimeHelpers
  before do
    Rack::Attack.enabled = true
    Rack::Attack.reset!
  end
  after do
    Rack::Attack.enabled = false
  end

  describe 'POST /encode' do
    let(:url_param) { Faker::Internet.url }
    let(:usera_headers) { {"REMOTE_ADDR": '1.0.0.1'} }
    let(:userb_headers) { {"REMOTE_ADDR": '1.0.0.2'} }

    def do_request(headers)
      post encode_api_shortener_path, params: { url: url_param }, headers: headers
    end

    context 'userA make more than 10 request in 1 minute' do
      it 'block the userA' do
        10.times do
          do_request(usera_headers)
          expect(response).to have_http_status(:ok)
        end

        do_request(usera_headers)
        expect(response.body).to include("Retry later")
        expect(response).to have_http_status(:too_many_requests)

        do_request(userb_headers)
        expect(response).to have_http_status(:ok)

        travel_to(1.minutes.from_now) do
          do_request(usera_headers)
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end
