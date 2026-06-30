require "rails_helper"

describe "Security headers" do
  it "sends hardening headers and a report-only CSP on public pages" do
    get "/"

    expect(response).to have_http_status(:ok)
    expect(response.headers["X-Frame-Options"]).to eq("SAMEORIGIN")
    expect(response.headers["X-Content-Type-Options"]).to eq("nosniff")
    expect(response.headers["Referrer-Policy"]).to eq("strict-origin-when-cross-origin")
    expect(response.headers["Permissions-Policy"]).to be_present
    # CSP is rolled out in report-only mode so it never blocks the existing layout.
    expect(response.headers["Content-Security-Policy-Report-Only"]).to be_present
    expect(response.headers["Content-Security-Policy"]).to be_nil
  end

  describe "admin layout" do
    let(:admin) { FactoryBot.create(:admin) }
    before { sign_in(admin) }
    after { sign_out }

    it "is marked noindex so the back office stays out of search engines" do
      get "/admin/problems"

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('name="robots"')
      expect(response.body).to include("noindex")
    end
  end
end
