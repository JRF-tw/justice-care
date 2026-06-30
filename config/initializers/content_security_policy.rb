# Be sure to restart your server when you modify this file.
#
# Content Security Policy (Rails 5.2 native DSL).
#
# This is deliberately shipped in REPORT-ONLY mode: the policy is evaluated by the
# browser and violations are reported, but nothing is blocked. That lets us harden
# without risking the existing layout / third-party embeds (GTM, YouTube, Mindomo).
# Once the reports come back clean, flip `content_security_policy_report_only` to
# false (and ideally drop :unsafe_inline / :unsafe_eval) to enforce it.
Rails.application.config.content_security_policy do |policy|
  policy.default_src :self
  policy.base_uri    :self
  policy.object_src  :none
  # Clickjacking protection (complements the X-Frame-Options: SAMEORIGIN default).
  policy.frame_ancestors :self

  # Inline/eval are still required by the current Bootstrap 3 + GTM setup.
  policy.script_src  :self, :unsafe_inline, :unsafe_eval,
                     "https://www.googletagmanager.com",
                     "https://www.google-analytics.com",
                     "https://ssl.google-analytics.com"
  policy.style_src   :self, :unsafe_inline
  policy.img_src     :self, :data, :https
  policy.font_src    :self, :data
  policy.connect_src :self,
                     "https://www.google-analytics.com",
                     "https://www.googletagmanager.com"
  # Embedded mind maps and videos used by analyses / solutions pages.
  policy.frame_src   :self,
                     "https://www.youtube.com",
                     "https://www.youtube-nocookie.com",
                     "https://www.mindomo.com",
                     "https://www.googletagmanager.com",
                     "https://www.facebook.com"
end

Rails.application.config.content_security_policy_report_only = true
