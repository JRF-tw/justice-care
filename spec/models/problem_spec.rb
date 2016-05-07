require "rails_helper"

describe Problem do
  let(:problem) {FactoryGirl.create(:problem)}

  it "#factory_creat_success" do
    expect {
      FactoryGirl.create :problem
    }.to change { Problem.count }.by(1)
  end
end