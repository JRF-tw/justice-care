xml.instruct! :xml, version: "1.0", encoding: "UTF-8"
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do
  [root_url, step1_url, step2_url, step3_url].each do |loc|
    xml.url do
      xml.loc loc
      xml.changefreq "weekly"
    end
  end

  @analyses.each do |analysis|
    xml.url do
      xml.loc analysis_url(analysis)
      xml.lastmod analysis.updated_at.iso8601
      xml.changefreq "monthly"
    end
  end

  @solutions.each do |solution|
    xml.url do
      xml.loc solution_url(solution)
      xml.lastmod solution.updated_at.iso8601
      xml.changefreq "monthly"
    end
  end
end
