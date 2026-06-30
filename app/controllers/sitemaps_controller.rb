class SitemapsController < ApplicationController
  # XML sitemap listing the public, indexable pages (static steps + all
  # analyses/solutions). Built from the DB so new content is picked up automatically.
  def index
    @analyses = Analysis.all
    @solutions = Solution.all
    respond_to do |format|
      format.xml
    end
  end

  # robots.txt rendered dynamically so the Sitemap directive uses the real host.
  def robots
    lines = [
      "User-agent: *",
      "Disallow: /admin",
      "Disallow: /users",
      "Disallow: /redactor_rails",
      "Allow: /",
      "",
      "Sitemap: #{request.base_url}/sitemap.xml"
    ]
    render plain: lines.join("\n") + "\n", content_type: "text/plain"
  end
end
