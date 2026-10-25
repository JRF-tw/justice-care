require "spec_helper"

describe "Solution" do


  let(:solution) { FactoryBot.create(:solution) }
  let(:new_solution) do
    {
      name: "new_solution_name",
    }
  end

  describe "#show" do
    it "success" do
      get "/solutions/#{solution.id}"
      expect(response).to be_successful
    end
  end

  describe "SEO metadata" do
    it "emits Article JSON-LD" do
      get "/solutions/#{solution.id}"
      expect(response.body).to include('"@type":"Article"')
    end
  end
end