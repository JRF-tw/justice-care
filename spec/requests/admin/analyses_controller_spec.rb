require "rails_helper"

describe "Admin/Analysis" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:analysis) { FactoryGirl.create(:analysis) }
  let(:new_analysis) do
    {
      title: "new_analysis_title",
      content: "new_analysis_content",
      image: File.open(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')),
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/analyses/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/analyses/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/analyses/#{analysis.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/analyses", params: { analysis: new_analysis }
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        analysis
        update_data = { title: "new_title" }
        put "/admin/analyses/#{analysis.id}", params: { analysis: update_data }
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        analysis
        expect {
          delete "/admin/analyses/#{analysis.id}"
        }.to change { Analysis.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end
  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/analyses/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/analyses/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/analyses/#{analysis.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/analyses", params: { analysis: new_analysis }
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        analysis
        update_data = { title: "new_title" }
        put "/admin/analyses/#{analysis.id}", params: { analysis: update_data }
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        analysis
        expect {
          delete "/admin/analyses/#{analysis.id}"
        }.to change { Analysis.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/analyses/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/analyses/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/analyses/#{analysis.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/analyses", params: { analysis: new_analysis }
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "success" do
        analysis
        update_data = { title: "new_title" }
        put "/admin/analyses/#{analysis.id}", params: { analysis: update_data }
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "success" do
        analysis
        expect {
          delete "/admin/analyses/#{analysis.id}"
        }.to change { Analysis.count }.by(-1)
        expect(response).to be_redirect
      end
    end
  end
end