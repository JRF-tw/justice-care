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

  describe "structured data" do
    it "embeds Organization and WebSite JSON-LD" do
      get "/"
      expect(response.body).to include('application/ld+json')
      expect(response.body).to include('"@type":"Organization"')
      expect(response.body).to include('"@type":"WebSite"')
    end
  end
end