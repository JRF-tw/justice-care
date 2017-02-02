require "spec_helper"

describe "Solution" do


  let(:solution) { FactoryGirl.create(:solution) }
  let(:new_solution) do
    {
      name: "new_solution_name",
    }
  end

  describe "#show" do
    it "success" do
      get "/solutions/#{solution.id}"
      expect(response).to be_success
    end
  end
end