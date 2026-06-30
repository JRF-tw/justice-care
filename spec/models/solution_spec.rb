require "rails_helper"

describe Solution do
  let(:solution) {FactoryBot.create(:solution)}

  it "#factory_creat_success" do
    expect {
      FactoryBot.create :solution
    }.to change { Solution.count }.by(1)
  end

  it "#order success" do
    solution1 = FactoryBot.create(:solution, no: 1)
    solution2 = FactoryBot.create(:solution, no: 2)
    solution3 = FactoryBot.create(:solution, no: 3)
    
    expect(Solution.all).to eq([solution1, solution2, solution3])
  end
end