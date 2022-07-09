Rack::Attack.enabled = ENV['ENABLE_RACK_ATTACK'] == 'true' || Rails.env.production?
Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

Rack::Attack.throttle('req/ip/api/encode-tries', limit: 10, period: 1.minute) do |req|
  req.ip if req.path.include?('/encode') && req.post?
end

