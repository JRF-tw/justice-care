require "rails_helper"

describe Problem do
  let(:problem) {FactoryGirl.create(:problem)}

  it "#factory_creat_success" do
    expect {
      FactoryGirl.create :problem
    }.to change { Problem.count }.by(1)
  end

  it "#vote_count" do
    problem.add = 3
    problem.save
    vote1 = FactoryGirl.create(:vote, problem: problem, created_at: 1.day.ago)
    vote2 = FactoryGirl.create(:vote, problem: problem, created_at: 2.days.ago)
    vote3 = FactoryGirl.create(:vote, problem: problem, created_at: 3.weeks.ago)
    problem.sync_votes_count
    expect(problem.count_total_votes).to eq(6)
    expect(problem.total_votes_cache).to eq(6)
    expect(problem.count_recently_votes).to eq(5)
    expect(problem.recently_votes_cache).to eq(5)
  end

  it "#order success" do
    problem1 = FactoryGirl.create(:problem, created_at: 3.day.ago)
    problem2 = FactoryGirl.create(:problem, created_at: 1.day.ago)
    problem3 = FactoryGirl.create(:problem, created_at: 2.day.ago)
    2.times {
      FactoryGirl.create(:vote, problem: problem1)
    }
    4.times {
      FactoryGirl.create(:vote, problem: problem1, created_at: 3.weeks.ago)
    }
    3.times {
      FactoryGirl.create(:vote, problem: problem2)
    }
    4.times {
      FactoryGirl.create(:vote, problem: problem3)
    }
    1.times {
      FactoryGirl.create(:vote, problem: problem3, created_at: 3.weeks.ago)
    }
    problem1.sync_votes_count
    problem1.reload
    problem2.sync_votes_count
    problem2.reload
    problem3.sync_votes_count
    problem3.reload
    expect(Problem.hot_order).to eq([problem3, problem2, problem1])
    expect(Problem.lastest_order).to eq([problem2, problem3, problem1])
    expect(Problem.votes_order).to eq([problem1, problem3, problem2])
  end
end


