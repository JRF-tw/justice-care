# Be sure to restart your server when you modify this file.
#
# Rails 5.2 already sends X-Frame-Options: SAMEORIGIN, X-Content-Type-Options: nosniff,
# X-XSS-Protection, X-Download-Options and X-Permitted-Cross-Domain-Policies by default.
# Here we add a couple of modern headers that Rails does not set out of the box.
Rails.application.config.action_dispatch.default_headers.merge!(
  # Don't leak full referrer URLs to third parties; still send the origin cross-site.
  "Referrer-Policy" => "strict-origin-when-cross-origin",
  # This site does not use camera / microphone / geolocation; deny them outright.
  "Permissions-Policy" => "camera=(), microphone=(), geolocation=()"
)
