require "rails_helper"

describe "Admin/Solution" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:solution) { FactoryGirl.create(:solution) }
  let(:new_solution) do
    {
      title: "new_solution_title",
      content: "new_solution_content"
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/solutions/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/solutions/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/solutions/#{solution.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/solutions", solution: new_solution
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        solution
        update_data = { title: "new_title" }
        put "/admin/solutions/#{solution.id}", solution: update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        solution
        expect {
          delete "/admin/solutions/#{solution.id}"
        }.to change { Solution.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end
  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/solutions/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/solutions/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/solutions/#{solution.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/solutions", solution: new_solution
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        solution
        update_data = { title: "new_title" }
        put "/admin/solutions/#{solution.id}", solution: update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        solution
        expect {
          delete "/admin/solutions/#{solution.id}"
        }.to change { Solution.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/solutions/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/solutions/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/solutions/#{solution.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/solutions", solution: new_solution
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "success" do
        solution
        update_data = { title: "new_title" }
        put "/admin/solutions/#{solution.id}", solution: update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "success" do
        solution
        expect {
          delete "/admin/solutions/#{solution.id}"
        }.to change { Solution.count }.by(-1)
        expect(response).to be_redirect
      end
    end
  end
end