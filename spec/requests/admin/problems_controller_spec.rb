require "rails_helper"

describe "Admin/Problem" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:problem) { FactoryGirl.create(:problem) }
  let(:new_problem) do
    {
      title: "new_problem_title",
      content: "new_problem_content",
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/problems/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/problems/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/problems/#{problem.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/problems", problem: new_problem
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        problem
        update_data = { title: "new_title" }
        put "/admin/problems/#{problem.id}", problem: update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        problem
        expect {
          delete "/admin/problems/#{problem.id}"
        }.to change { Problem.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end
  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/problems/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/problems/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/problems/#{problem.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/problems", problem: new_problem
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        problem
        update_data = { title: "new_title" }
        put "/admin/problems/#{problem.id}", problem: update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        problem
        expect {
          delete "/admin/problems/#{problem.id}"
        }.to change { Problem.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/problems/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/problems/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/problems/#{problem.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/problems", problem: new_problem
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "success" do
        problem
        update_data = { title: "new_title" }
        put "/admin/problems/#{problem.id}", problem: update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "success" do
        problem
        expect {
          delete "/admin/problems/#{problem.id}"
        }.to change { Problem.count }.by(-1)
        expect(response).to be_redirect
      end
    end
  end
end