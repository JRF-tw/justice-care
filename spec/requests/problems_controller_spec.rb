require "rails_helper"

describe "Problems" do
  let(:problem) { FactoryGirl.create(:problem) }
  let(:user) { FactoryGirl.create(:user) }

  describe "after login user" do
    before { sign_in(user) }
    after { sign_out }
    describe "#vote" do
      it "#success" do
        problem
        vote_data = {
          problem: {
            vote: true
          }
        }
        post "/problems/#{problem.id}/vote", vote_data
        problem.reload
        expect(problem.total_votes_cache).to eq(1)
        expect(problem.recently_votes_cache).to eq(1)
      end
    end

    describe "#unvote" do
    end
  end
end