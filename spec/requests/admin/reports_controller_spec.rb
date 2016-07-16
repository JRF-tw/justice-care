require "rails_helper"

describe "Admin/Report" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:analysis) { FactoryGirl.create(:analysis) }
  let(:report) { FactoryGirl.create(:report) }
  let(:new_report) do
    {
      title: "new_report_title",
      analysis_id: analysis.id,
      content: "new_report_content"
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/analyses/#{analysis.id}/reports/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/analyses/#{analysis.id}/reports/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/analyses/#{analysis.id}/reports/#{report.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/analyses/#{analysis.id}/reports", report: new_report
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        report
        update_data = { title: "new_title" }
        put "/admin/analyses/#{analysis.id}/reports/#{report.id}", report: update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        report
        expect {
          delete "/admin/analyses/#{analysis.id}/reports/#{report.id}"
        }.to change { Report.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end
  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/analyses/#{analysis.id}/reports/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/analyses/#{analysis.id}/reports/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/analyses/#{analysis.id}/reports/#{report.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/analyses/#{analysis.id}/reports", report: new_report
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        report
        update_data = { title: "new_title" }
        put "/admin/analyses/#{analysis.id}/reports/#{report.id}", report: update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        report
        expect {
          delete "/admin/analyses/#{analysis.id}/reports/#{report.id}"
        }.to change { Report.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#new" do
      it "success" do
        get "/admin/analyses/#{analysis.id}/reports/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/analyses/#{analysis.id}/reports/#{report.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        expect {
          post "/admin/analyses/#{analysis.id}/reports", report: new_report
        }.to change { Report.count }.by(1)
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "success" do
        report
        update_data = { title: "new_title" }
        put "/admin/analyses/#{analysis.id}/reports/#{report.id}", report: update_data
        expect(response).to be_redirect
        report.reload
        expect(report.title).to match(update_data[:title])
      end
    end

    describe "#destroy" do
      it "success" do
        report
        expect {
          delete "/admin/analyses/#{analysis.id}/reports/#{report.id}"
        }.to change { Report.count }.by(-1)
        expect(response).to be_redirect
      end
    end
  end
end