# Be sure to restart your server when you modify this file.

# httponly keeps the cookie out of JS; same_site: :lax is CSRF defense-in-depth.
# The Secure flag is applied automatically in production via config.force_ssl.
Rails.application.config.session_store :cookie_store,
                                       key: '_justice-care_session',
                                       httponly: true,
                                       same_site: :lax
