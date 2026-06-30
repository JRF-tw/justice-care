# Be sure to restart your server when you modify this file.
#
# rack-attack auto-inserts itself into the middleware stack. These rules throttle
# request floods and brute-force login attempts.

# A per-process memory store needs no extra infrastructure. For multi-process /
# multi-server deployments, back this with a shared store (Memcached/Redis) so the
# counters are accurate across workers.
Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

# The test suite signs in repeatedly from a single IP; don't throttle it.
Rack::Attack.enabled = !Rails.env.test?

# General flood protection: 300 requests / 5 minutes per IP (static assets exempt).
Rack::Attack.throttle("req/ip", limit: 300, period: 5.minutes) do |req|
  req.ip unless req.path.start_with?("/assets")
end

# Brute-force protection on password sign-in: by IP...
Rack::Attack.throttle("logins/ip", limit: 5, period: 20.seconds) do |req|
  req.ip if req.path == "/users/sign_in" && req.post?
end

# ...and by the submitted email address.
Rack::Attack.throttle("logins/email", limit: 5, period: 20.seconds) do |req|
  if req.path == "/users/sign_in" && req.post?
    req.params.dig("user", "email").to_s.downcase.strip.presence
  end
end

# Throttle password-reset / confirmation / unlock resends (per IP) to curb abuse.
Rack::Attack.throttle("account/ip", limit: 5, period: 1.minute) do |req|
  req.ip if req.post? && %w[/users/password /users/confirmation /users/unlock].include?(req.path)
end

# Respond to throttled clients with 429 + a short Retry-After.
Rack::Attack.throttled_responder = lambda do |_req|
  [429, { "Content-Type" => "text/plain", "Retry-After" => "20" }, ["Too many requests. Please retry later.\n"]]
end
