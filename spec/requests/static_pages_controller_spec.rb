require "rails_helper"

describe "Static pages" do
  describe "#home" do
    it "success" do
      get "/"
      expect(response).to be_success
    end
  end

  describe "#step1" do
    it "success" do
      get "/step1"
      expect(response).to be_success
    end
  end

  describe "#step2" do
    it "success" do
      get "/step2"
      expect(response).to be_success
    end
  end

  describe "#step3" do
    it "success" do
      get "/step3"
      expect(response).to be_success
    end
  end
end