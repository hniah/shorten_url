class Rack::Attack
  cache.store = ActiveSupport::Cache::MemoryStore.new

  throttle('req/ip', limit: 5, period: 1.minute) do |req|
    req.ip
  end
end
