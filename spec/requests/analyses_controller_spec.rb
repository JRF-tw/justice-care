require "spec_helper"

describe "Analysis" do


  let(:analysis) { FactoryGirl.create(:analysis) }
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
      2.times { FactoryGirl.create(:report, analysis: analysis) }
      get "/analyses/#{analysis.id}"
      expect(response).to be_success
    end
  end
end