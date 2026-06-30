require "rails_helper"

describe "Sitemaps" do
  describe "GET /sitemap.xml" do
    it "lists static pages plus every analysis and solution" do
      analysis = FactoryBot.create(:analysis)
      solution = FactoryBot.create(:solution)

      get "/sitemap.xml"

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include("xml")
      expect(response.body).to include("<urlset")
      expect(response.body).to include("/analyses/#{analysis.id}")
      expect(response.body).to include("/solutions/#{solution.id}")
    end
  end

  describe "GET /robots.txt" do
    it "blocks private areas and advertises the sitemap" do
      get "/robots.txt"

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include("text/plain")
      expect(response.body).to include("Disallow: /admin")
      expect(response.body).to include("Disallow: /users")
      expect(response.body).to include("Disallow: /redactor_rails")
      expect(response.body).to match(%r{Sitemap: https?://[^/]+/sitemap\.xml})
    end
  end
end
