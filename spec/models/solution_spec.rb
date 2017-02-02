require "rails_helper"

describe Solution do
  let(:solution) {FactoryGirl.create(:solution)}

  it "#factory_creat_success" do
    expect {
      FactoryGirl.create :solution
    }.to change { Solution.count }.by(1)
  end

  it "#order success" do
    solution1 = FactoryGirl.create(:solution, no: 1)
    solution2 = FactoryGirl.create(:solution, no: 2)
    solution3 = FactoryGirl.create(:solution, no: 3)
    
    expect(Solution.all).to eq([solution1, solution2, solution3])
  end
end