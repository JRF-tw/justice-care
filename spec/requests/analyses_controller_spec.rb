require "spec_helper"

describe "Analysis" do


  let(:analysis) { FactoryBot.create(:analysis) }
  let(:new_analysis) do
    {
      name: "new_analysis_name",
    }
  end

  describe "#show" do
    it "success" do
      get "/analyses/#{analysis.id}"
      expect(response).to be_success
    end
  end

  describe "#show_with_report" do
    it "success" do
      2.times { FactoryBot.create(:report, analysis: analysis) }
      get "/analyses/#{analysis.id}"
      expect(response).to be_success
    end
  end

  describe "SEO metadata" do
    it "emits Article JSON-LD and an og:image for the analysis" do
      get "/analyses/#{analysis.id}"
      expect(response.body).to include('"@type":"Article"')
      expect(response.body).to include('property="og:image"')
      # og:image should point at the analysis's own uploaded image, not the default.
      expect(response.body).to include("/uploads/")
    end
  end
end