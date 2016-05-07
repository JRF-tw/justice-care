require "rails_helper"

describe Vote do
  let(:vote) {FactoryGirl.create(:vote)}

  it "#factory_creat_success" do
    expect {
      FactoryGirl.create :vote
    }.to change { Vote.count }.by(1)
  end
end